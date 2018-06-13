class AddArticleToParagraphs < ActiveRecord::Migration[5.1]
  def change
    add_reference :paragraphs, :article, foreign_key: true, null: false
  end
end
