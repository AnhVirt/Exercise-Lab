class Comment < ApplicationRecord
		validates :content , presence: true
	  belongs_to :account
    belongs_to :article
end
