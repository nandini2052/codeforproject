class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
    	t.string :sellername
    	t.string :email
    	t.timestamps
    end
  end
end
