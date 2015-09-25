class LocateStoresController < ApplicationController

  require 'net/http'

  def index
    @product = Product.new
   @stores = Store.select('lat, long')
   if params[:query]
    @available_stores = Product.search(params[:query])
  end
end

def search
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
       
       product = Product.where("name like '%#{params[:query]}%'") #Product.find_by_sql("Select * from products where name = '#{params[:query].capitalize}'")
       

       # url = URI.parse("http://store-hack.herokuapp.com/api/stores?store_id=#{store.first.id}&&product_id=#{product.first.id}")

       #    req = Net::HTTP::Get.new(url.to_s)
       #        res = Net::HTTP.start(url.host, url.port) {|http|
       #        http.request(req)
       #    }

       @arr_stores << store

     end  
   end






 end
