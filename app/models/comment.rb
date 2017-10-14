class Comment < ApplicationRecord
	validates :content , presence: true
	belongs_to :user
  belongs_to :article,touch: true
  has_one :photo, :as=> :phototable,dependent: :destroy
end
