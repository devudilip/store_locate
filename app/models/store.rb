class Store < ActiveRecord::Base
  require 'open-uri'
  require 'json'
  has_many :store_products
  has_many :products, through: :store_products
  
  # CReate seeds from Tesco STore API
  def self.create_seeds_using_stores_api
    #{lat: 51.508530, lng: -0.076132}
    long = -0.076132
    lat = 51.508530
    store_API_results = JSON.parse(open("http://api.tescolabs.com/api/stores/#{long},#{lat}").read)
    store_API_results["results"].each {|f| 
      p "Store.create(name: " +"'"+ f["obj"]["placeName"].to_s + "'," + "address:" + "'" + f["obj"]["placeName"].concat(f["obj"]["_id"]).to_s+ "'," + "lat:" + "'" + f["obj"]["lat"].to_s + "'," + "long:" + "'" + f["obj"]["lng"].to_s + "'," + "location_id:" + "'" +  f["obj"]["_id"].to_s+ "'," + "store_distance:" + "'" + f["dis"].to_s+ "'," + "store_type:" + "'" +f["obj"]["typ"].to_s+ "'"")"
    }
   # return store_API
    # store_API will store list of 5 nearest TESCO stores
    # send list of product ids and the store_API result to devu API.
  end
  
  


  def self.get_near_stores(lat,lang)
  end

  def self.max_prod_avail(product_ids)
    found_stores = []
    stores = Store.all
    stores.each do |store|
      response = Product.search_availability(store.id,product_ids)
      found_stores << {store: store.id,count: response[:count], distance: store.store_distance, lat: store.lat, lng: store.long, store_name: store.name,
       address: store.address, store_distance: store.store_distance, store_type: store.store_type  } if response[:count] > 0
     end
    # store_by_count = found_stores.sort_by { |store| store[:count] }.last
    # store_by_distance = found_stores.select{|store| store[:count] == store_by_count[:count]}.sort_by{|dis| dis[:distance]}.first[:store]
    return found_stores
  end

end
