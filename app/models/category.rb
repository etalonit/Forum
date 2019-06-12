class Category < ApplicationRecord
	has_many :articles
	validates :name, presence: true
	has_ancestry
	paginates_per 3
end
