class Product < ActiveRecord::Base
  has_many :store_products
  has_many :stores, through: :store_products

  def self.search_availability(store, products)
    store = Store.find(store)
    products =  products.split(',').flatten.map(&:to_i)
    product = store.products.includes(:store_products).where("store_products.product_id in (?)", products).select('id')
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

 end
