class Store < ActiveRecord::Base
  require 'open-uri'
  require 'json'
  has_many :store_products
  has_many :products, through: :store_products
  
  def self.search_using_stores_api
    #{lat: 51.508530, lng: -0.076132}
    long = -0.076132
    lat = 51.508530
    store_API = JSON.parse(open("http://api.tescolabs.com/api/stores/#{long},#{lat}").read)
    return store_API
    # store_API will store list of 5 nearest TESCO stores
    # send list of product ids and the store_API result to devu API.
  end

end
