class Gallery < ApplicationRecord
  belongs_to :article
  has_many :images, dependent: :delete_all
end
