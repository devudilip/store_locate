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
  
  

end
