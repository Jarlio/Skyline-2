class AddGalleryToImage < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :gallery, foreign_key: true, null: false
  end
end
