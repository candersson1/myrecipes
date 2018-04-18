class TryAddingTimestampsAgain < ActiveRecord::Migration[5.1]
   def change_table
      add_timestamps(:chefs)
   end

end
