class ChangeTimeStamps < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :created_at, :datetime
    change_column :houses, :updated_at, :datetime
  end
end
