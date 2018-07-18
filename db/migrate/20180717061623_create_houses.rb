class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :location
      t.text :Address
      t.integer :Rent
      t.text :Description
    end
  end
end
