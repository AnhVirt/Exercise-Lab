class Article < ApplicationRecord
	validates :content , presence: true
	belongs_to :account
	has_many :comments, dependent: :destroy
	has_many :photos  ,:as=>:phototable,dependent: :destroy
	accepts_nested_attributes_for :photos,reject_if: :all_blank,allow_destroy: true
	default_scope -> {order(id: :desc)}
	def cache_comment_count
		Rails.cache.fetch([self,"comments_count"]) {comments.size}
	end
		def cache_comment
		Rails.cache.fetch([self,"comments"]) {comments.to_a}
	end

end
