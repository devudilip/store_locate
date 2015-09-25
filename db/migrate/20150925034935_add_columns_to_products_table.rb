class AddColumnsToProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :tpnb, :integer
  end
end
