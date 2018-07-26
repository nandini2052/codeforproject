class PhotoAdd < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :photos, :string
  end
end
