class AddPhotoToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :images, :text
  end
end
