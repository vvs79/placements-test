class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string  :title
      t.text    :description
      t.decimal :price, precision: 10, scale: 2
      t.text    :address

      t.timestamps null: false
    end
    add_index  :places, :title
  end
end
