# article model
class Article < ApplicationRecord
  validates :title, presence: true
  validates :intro, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
