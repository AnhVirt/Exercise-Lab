class Account < ApplicationRecord
	attr_accessor  :password_comfirmation, :remember_token
	before_save { self.email = email.downcase }
	validates  :email, presence: true, uniqueness: { message:" da duoc dang ki"}

	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	# enum status: [:pending,:accept]
	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}
	validates_confirmation_of :password
	
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	has_attached_file :wallpaper, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :wallpaper, content_type: /\Aimage\/.*\z/
	
	has_many :articles,:dependent => :destroy

	has_many :comments,:dependent => :destroy

	has_many :add_friends,class_name: "Friendship", dependent: :destroy, foreign_key: :follower_id

	has_many :xfriends, -> { where.not( friendships: { status: :pending})}, through: :add_friends, source: :followed

	has_many :x_wait_friends,-> { where( friendships: { status: :pending})}, through: :add_friends, source: :followed
	
	has_many :invite_friends,class_name: "Friendship",dependent: :destroy,foreign_key: :followed_id
	
	has_many :yfriends, -> { where.not(friendships: {status: :pending})},through: :invite_friends,source: :follower
	
	has_many :y_wait_friends, -> { where(friendships: {status: :pending})},through: :invite_friends,source: :follower


	has_secure_password
	def friends
		xfriends + yfriends
	end
	def wait_friends
		x_wait_friends + y_wait_friends
	end
	def friendships
		add_friends + invite_friends
	end

end
