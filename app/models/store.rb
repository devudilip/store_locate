class Store < ActiveRecord::Base
  has_many :store_products
  has_many :products, through: :store_products
end
