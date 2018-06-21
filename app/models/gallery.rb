class Gallery < ApplicationRecord
  belongs_to :article
  has_many :images
end
