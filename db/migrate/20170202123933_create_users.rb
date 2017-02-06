class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :login
      t.boolean :admin

      t.timestamps null: false
    end
    add_index  :users, :name
    add_index  :users, :login
  end
end
