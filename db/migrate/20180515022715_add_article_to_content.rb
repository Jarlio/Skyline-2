# add reference to article that belongs to paragraph
class AddArticleToContent < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :article, foreign_key: true
  end
end
