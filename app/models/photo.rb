class Photo < ApplicationRecord
	validates :title , presence: true
	belongs_to :articles
	belongs_to :comment
end
