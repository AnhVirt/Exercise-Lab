class Account < ApplicationRecord
	
	
	validates  :email, presence: true, uniqueness:{ messenger:"Email da duoc dang ki"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}

	
	
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
	validates_attachment :avatar
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg",
	content_type: { content_type: ["image/jpeg","image/png","image/jpg" ]}
	
	
	validates_with AttachmentSizeValidator, attributes: :wallpaper, less_than: 1.megabytes
	validates_attachment :wallpaper
	has_attached_file :wallpaper, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg",
	content_type: { content_type: ["image/jpeg","image/png","image/jpg" ]}
	
	has_many :articles,:dependent => :destroy
	has_many :comments,:dependent => :destroy
	has_many :active_relationships,:dependent=>:destroy, class_name: "Relationship",foreign_key: "follower_id"
	has_many :following, through: :active_relationships, source: :followed
	has_secure_password
	def follow(other_user)
		following << other_user
	end
	
end
