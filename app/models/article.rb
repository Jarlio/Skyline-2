# each user can write articles.
# Initial, the articles have just a title and a intro (type text)
# afterward the user can add paragraphs, charts, table, galleries of photos and code/references
class Article < ApplicationRecord
  validates :title, presence: true
  validates :intro, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :paragraphs, dependent: :delete_all
  has_many :galleries, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :ratings, dependent: :delete_all
  has_and_belongs_to_many :tags,
                          class_name: "Tag",
                          foreign_key: "Article_id",
                          join_table: "Articles_Tags",
                          association_foreign_key: "Tag_id"

  # get rating
  def average_rating
    ratings.sum(:score) / ratings.size
  end

end
