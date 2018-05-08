# a paragraph is a part of an article
# it has a title (like a subtitle of the article) and a content (type text)
class Paragraph < ApplicationRecord
  validates :content, presence: true

  belongs_to :article
end
