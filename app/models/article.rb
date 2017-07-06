class Article < ApplicationRecord
	attr_accessor :images
	validates :content , presence: true
	belongs_to :account
	has_many :comments, :dependent => :destroy
	has_many :photos ,:dependent => :destroy ,:as=>:phototable
end
