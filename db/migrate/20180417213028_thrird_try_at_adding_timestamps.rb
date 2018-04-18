class ThrirdTryAtAddingTimestamps < ActiveRecord::Migration[5.1]
    def change_table
    
      add_column :chefs, :created_at, :datetime, null: false
      add_column :chefs, :updated_at, :datetime, null: false
 
    end
  
end
