class Message < ApplicationRecord
	validates :text,presence: true, length: 1..1000
	belongs_to :talk
	belongs_to :account
end
