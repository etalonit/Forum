class Article < ApplicationRecord

	belongs_to :user
	acts_as_votable
	has_many :comments, dependent: :destroy

	validates :title, :content, :user_id, presence: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image , content_type: /\Aimage\/.*\z/
	
end
