class AddingApartmentName < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :apartmentname, :string
  end
end
