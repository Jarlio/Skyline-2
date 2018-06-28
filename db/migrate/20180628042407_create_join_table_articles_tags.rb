class CreateJoinTableArticlesTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Articles, :Tags do |t|
      t.index [:article_id, :tag_id]
      # t.index [:tag_id, :article_id]
    end
  end
end
