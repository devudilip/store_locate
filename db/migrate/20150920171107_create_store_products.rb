class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
      t.references :product, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.integer :quantity
      t.boolean :available

      t.timestamps null: false
    end
  end
end
