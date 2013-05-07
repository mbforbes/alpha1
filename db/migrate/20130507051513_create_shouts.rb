class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.text :body
      t.string :who

      t.timestamps
    end
  end
end
