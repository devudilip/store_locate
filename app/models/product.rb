class Product < ActiveRecord::Base
  has_many :store_products
  has_many :stores, through: :store_products
end
