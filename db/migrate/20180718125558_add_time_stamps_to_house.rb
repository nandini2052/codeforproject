class AddTimeStampsToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :created_at, :date_time
    add_column :houses, :updated_at, :date_time
  end
end
