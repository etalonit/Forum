class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  acts_as_voter

  validates :email, presence: true
  validates_associated :articles
  validates :password, length: 5..20
  validates :email, uniqueness: true 
   
  extend FriendlyId
  friendly_id :username, use: :slugged
        
end
