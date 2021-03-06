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

  has_many :articles, dependent: :delete_all
  has_many :tags, through: :articles
  has_many :comments, dependent: :delete_all
  has_many :ratings, dependent: :delete_all
end
