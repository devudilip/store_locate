class Store < ActiveRecord::Base
  has_many :store_products
  has_many :products, through: :store_products


  def self.get_near_stores(lat,lang)
  end

  def self.max_prod_avail(product_ids)
    found_stores = []
    stores = Store.all
    stores.each do |store|
      response = Product.search_availability(store.id,product_ids)
      found_stores << {store: store.id,count: response[:count], distance: store.store_distance, lat: store.lat, lng: store.long} if response[:count] > 0
    end
    # store_by_count = found_stores.sort_by { |store| store[:count] }.last
    # store_by_distance = found_stores.select{|store| store[:count] == store_by_count[:count]}.sort_by{|dis| dis[:distance]}.first[:store]
    return found_stores
  end

end
