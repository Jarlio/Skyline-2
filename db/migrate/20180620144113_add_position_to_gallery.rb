class AddPositionToGallery < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :position, :integer, null: false
  end
end
