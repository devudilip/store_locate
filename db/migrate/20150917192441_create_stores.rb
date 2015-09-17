class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.decimal :lat
      t.decimal :long
      t.string :pin
      t.integer :phone

      t.timestamps null: false
    end
  end
end
