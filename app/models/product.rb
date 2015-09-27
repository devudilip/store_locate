class Product < ActiveRecord::Base
 
  require 'open-uri'
  require 'json'
  has_many :store_products
  has_many :stores, through: :store_products

  def self.search_availability(store, product)
    p ">>>>>>>>>>>>>>>>>>>>>>>"
    StoreProduct.where(store_id: store, product_id: product).count > 0
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
    def self.product_service_API_list
     
     result_json =  JSON.parse(open("http://ess-search-ppe.westeurope.cloudapp.azure.com/api/search/?query=bread&fields=tpnb,unitprice,price,name,description,IsNew,IsSpecialOffer,image,id,PromotionDescription,PromotionId,PromotionIcon,PromotionStart,PromotionEnd,ContentsMeasureType,ContentsQuantity,UnitQuantity,AverageSellingUnitWeight,UnitOfSale").read)
     
     matched_products = result_json["uk"]["ghs"]["products"]["results"].collect {|val| {val["tpnb"] => val["name"]} }
     matched_products.each {|f| puts f.keys }
    end
        
 end
