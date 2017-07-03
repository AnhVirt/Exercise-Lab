class Account < ApplicationRecord
	
	
	validates  :email, presence: true, uniqueness:{ messenger:"Email da duoc dang ki"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}
	has_many :articles
	has_many :comments
	has_attached_file :avatar, styles: { medium: "3000x3000>", thumb: "1000x1000>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  	validates :avatar, attachment_presence: true
	validates_with AttachmentPresenceValidator, attributes: :avatar
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
	validates_attachment :avatar
  		has_many :photos
	  has_secure_password

	
end
