class Article < ApplicationRecord

	belongs_to :user
	acts_as_votable
	has_many :comments, dependent: :destroy

	validates :title, :content, :user_id, presence: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image , content_type: /\Aimage\/.*\z/

    has_attached_file :audio
    validates_attachment :audio, :content_type => { :content_type => ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]}

end
