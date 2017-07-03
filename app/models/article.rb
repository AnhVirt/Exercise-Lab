class Article < ApplicationRecord
	validates :content , presence: true
	belongs_to :account
	has_many :comments
	has_many :photos
end
