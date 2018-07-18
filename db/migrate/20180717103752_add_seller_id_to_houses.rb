class AddSellerIdToHouses < ActiveRecord::Migration[5.2]
  def change
  	add_column :houses, :seller_id, :integer
  
  end
end
