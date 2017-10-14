class Talk < ApplicationRecord
	enum talk_type: [:personal,:list]
	enum status: [:normal,:block]
	has_many :messages,dependent: :destroy
	has_many :chaters,dependent: :destroy
	has_many :users,through: :chaters
	end
