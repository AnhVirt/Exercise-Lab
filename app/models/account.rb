class Account < ApplicationRecord
	
	
	validates  :email, presence: true, uniqueness:{ messenger:"Email da duoc dang ki"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}

	validates :avatar, attachment_presence: true
	
	validates_with AttachmentPresenceValidator, attributes: :avatar
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
	validates_attachment :avatar
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
	validates :wallpaper, attachment_presence: true
	
	validates_with AttachmentPresenceValidator, attributes: :wallpaper
	validates_with AttachmentSizeValidator, attributes: :wallpaper, less_than: 1.megabytes
	validates_attachment :wallpaper
	has_attached_file :wallpaper, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"

	has_many :articles,:dependent => :destroy
	has_many :comments,:dependent => :destroy
	has_secure_password

	
end
