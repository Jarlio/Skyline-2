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
  has_many :tags, dependent: :delete_all
end
