class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments, dependent: :destroy

  validates :email, presence: true
  validates_associated :articles
  validates :password, length: 5..20
  validates :email, uniqueness: true 
         
end
