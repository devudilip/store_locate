class AddColumnsToTheExistingTables < ActiveRecord::Migration
  def change
        add_column :stores, :location_id, :string
        add_column :stores, :store_distance, :decimal
        add_column :stores, :store_type, :string
                
  end
  
end
