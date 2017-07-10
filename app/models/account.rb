class Account < ApplicationRecord
	attr_accessor  :password_comfirmation, :remember_token
	before_save { self.email = email.downcase }
	validates  :email, presence: true, uniqueness: { message:" da duoc dang ki"}

	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}
	validates_confirmation_of :password
 	
	
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	
	 has_attached_file :wallpaper, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :wallpaper, content_type: /\Aimage\/.*\z/
	
	has_many :articles,:dependent => :destroy
	has_many :comments,:dependent => :destroy
	has_many :active_relationships,:dependent=>:destroy, class_name: "Relationship",foreign_key: "follower_id"
	has_many :following, through: :active_relationships, source: :followed
	has_secure_password
	 def forget
    update_attribute(:remember_digest, nil)
  end
	
	def follow(other_user)
		following << other_user
	end
	def Account.new_token
		SecureRandom.urlsafe_base64
	end
	def Account.digest(string)
		 cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
		
	end
	def remember
		self.remember_token = Account.new_token
		

		update_attribute(:remember_token,Account.digest(remember_token))
		
	end
	def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
 

end
