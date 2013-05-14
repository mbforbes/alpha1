class RemoveWhoFromShouts < ActiveRecord::Migration
  def change
  	remove_column :shouts, :who
  end
end
