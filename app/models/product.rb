class Product < ActiveRecord::Base
  has_many :store_products
  has_many :stores, through: :store_products

  def self.search_availability(store, product)
    StoreProduct.where(product_id: store, store_id: product, available: true).count < 0
  end

end
