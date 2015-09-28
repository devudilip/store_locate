class Product < ActiveRecord::Base
 
  require 'open-uri'
  require 'json'
  has_many :store_products
  has_many :stores, through: :store_products

  def self.search_availability(store, products)
    store = Store.find(store)
    #products =  products.split(',').flatten.map(&:to_i)
    
    product = store.products.includes(:store_products).where("store_products.product_id in (?)", [6, 16]).select('id')
    result = {store_lat: store.lat, store_long: store.long, avail_product: product, count: product.count}
    return result
  end

  def self.search(name)
    @stores = Store.all

    @arr_stores = []

    @stores.each do |store|


     cos_lat = Math.cos(store.lat.to_f * (Math::PI)/180)
     sin_lat = Math.sin(store.lat.to_f * (Math::PI) / 180)
     cos_lng = Math.cos(store.long.to_f * (Math::PI) / 180)
     sin_lng = Math.sin(store.long.to_f * (Math::PI) / 180)

     cur_cos_lat = Math.cos(51.508530 * (Math::PI) / 180)
     cur_sin_lat = Math.sin(51.508530 * (Math::PI) / 180)
     cur_cos_lng = Math.cos(-0.076132 * (Math::PI) / 180)
     cur_sin_lng = Math.sin(-0.076132 * (Math::PI) / 180)

       cos_allowed_distance = Math.cos(50.0 / 6371) # This is 2km

       store = Store.find_by_sql("SELECT * FROM stores WHERE #{cur_sin_lat} * #{sin_lat} + #{cur_cos_lat} * #{cos_lat} * (#{cos_lng}* #{cur_cos_lng} + #{sin_lng} * #{cur_sin_lng}) > #{cos_allowed_distance}")
       product = Product.where("name like '%#{name}%'") # Product.find_by_sql("Select * from products where name like '#{name.capitalize}'")
       store.each do |s|
        @arr_stores << s if !product.blank? and Product.search_availability(s.id, product.first.id)
        p ".>>>>>>>>>>>>>>>>>>"
        p s 
      end


       # url = URI.parse("http://store-hack.herokuapp.com/api/stores?store_id=#{store.first.id}&&product_id=#{product.first.id}")

       #    req = Net::HTTP::Get.new(url.to_s)
       #        res = Net::HTTP.start(url.host, url.port) {|http|
       #        http.request(req)
       #    }
       

       p @arr_stores
       return @arr_stores#.flatten!
     end
   end

 # product service method
    def self.find_prod_id(name=nil)
 
       if name != "" 
          product = Product.where("name like '#{name}%'") 
            if !product.blank?
              product_hash = product.map { |x, i| [ x.name] } 
               return product_hash.flatten.to_json
            end
        end
    end
    
    
    
    # product service TESCO public API
    def self.create_seeds_product_service_API_list(product_search)
     
     product_results =  JSON.parse(open("http://ess-search-ppe.westeurope.cloudapp.azure.com/api/search/?query=#{product_search}&fields=tpnb,unitprice,price,name,description,IsNew,IsSpecialOffer,image,id,PromotionDescription,PromotionId,PromotionIcon,PromotionStart,PromotionEnd,ContentsMeasureType,ContentsQuantity,UnitQuantity,AverageSellingUnitWeight,UnitOfSale").read)
     
       product_results["uk"]["ghs"]["products"]["results"].each { |f|
       p "Product.create(name:" + "'" + f["name"].to_s + "'," + "description:" + "'" + f["description"].to_s + "'," + "price:" + "'" + f["unitprice"].to_s + "'," + "tpnb:" + "'" + f["tpnb"].to_s + "'" + ")"
     }
     #product_results.each {|res| p res }
     # product service to be called from search
    # matched_products = result_json["uk"]["ghs"]["products"]["results"].collect {|val| {val["tpnb"] => val["name"]} }
     
     #return matched_products.each {|f| puts f.keys }
    end
        
 end
