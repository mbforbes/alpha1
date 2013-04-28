class AddIndexToUsersMtgname < ActiveRecord::Migration
  def change
  	add_index :users, :mtgname, unique: true
  end
end
