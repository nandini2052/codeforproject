class AddTimeToHouses < ActiveRecord::Migration[5.2]
  def change
  	add_column :houses, :time, :timestamps
  end
end
