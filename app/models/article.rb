class Article < ApplicationRecord
	validates :content , presence: true
	belongs_to :account
	has_many :comments, :dependent => :destroy
	has_many :photos ,:dependent => :destroy ,:as=>:phototable
	accepts_nested_attributes_for :photos,reject_if: :all_blank,allow_destroy: true
	default_scope -> {order(id: :desc)}
end
