class Paragraph < ApplicationRecord

  validates :text, presence: :true

  belongs_to :article
end
