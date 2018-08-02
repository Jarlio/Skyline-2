class AddArticleToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :article, foreign_key: true, null: false
  end
end
