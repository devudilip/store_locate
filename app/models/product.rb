class Product < ActiveRecord::Base
  has_many :store_products
  has_many :stores, through: :store_products

  def self.search_availability(store, product)
    StoreProduct.where(store_id: store, product_id: product).count > 0
  end

end
