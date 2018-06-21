class AddArticleToGallery < ActiveRecord::Migration[5.1]
  def change
    add_reference :galleries, :article, foreign_key: true, null: false
  end
end
