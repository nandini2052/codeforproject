class ReplaceColumnsInHouses < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :seller_id
    add_column :houses, :user_id, :integer
  end
end
