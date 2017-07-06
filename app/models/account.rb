class Account < ApplicationRecord
	
	
	validates  :email, presence: true, uniqueness:{ messenger:"Email da duoc dang ki"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}

	validates :avatar, attachment_presence: true
	
	validates_with AttachmentPresenceValidator, attributes: :avatar
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
	validates_attachment :avatar
	has_attached_file :avatar, styles: { medium: "3000x3000>", thumb: "1000x1000>" }, default_url: "/images/:style/missing.png"
	has_many :gallaries,:dependent => :destroy
	has_many :articles,:dependent => :destroy
	has_many :comments,:dependent => :destroy
	has_secure_password

	
end
