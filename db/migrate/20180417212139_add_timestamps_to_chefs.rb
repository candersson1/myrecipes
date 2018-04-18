class AddTimestampsToChefs < ActiveRecord::Migration[5.1]
  def change
    def change_table
      add_timestamps(:chefs)
    end
  end
end
