class AddTimestampsToChef < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :created_at, :datetime
    add_column :chefs, :updated_at, :datetime
  end
end
