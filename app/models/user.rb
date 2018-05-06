# user model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, BackgroundUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  has_many :articles
end
