class AddArticleToTag < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :article, foreign_key: true, null: false
  end
end
