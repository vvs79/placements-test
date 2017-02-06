class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.text :images
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
