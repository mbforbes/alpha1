class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mtgname
      t.string :realname
      t.string :password_digest

      t.timestamps
    end
  end
end
