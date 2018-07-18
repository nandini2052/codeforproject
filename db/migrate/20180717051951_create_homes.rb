class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :location
      t.text :Address
      t.integer :Rent
      t.string :image
      t.text :Description
    end
  end
end
