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
      found_stores << {store: store.id,count: response[:count]}
    end
    return Store.find(found_stores.sort_by { |store| store[:count] }.last[:store])
  end

end
