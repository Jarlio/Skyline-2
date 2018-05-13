class AddArticleToParagraph < ActiveRecord::Migration[5.1]
  def change
    add_reference :paragraphs, :articles, foreign_key: true, null: false
  end
end
