class User < ApplicationRecord
 	extend FriendlyId
  friendly_id :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  before_save {self.user_name = SecureRandom.urlsafe_base64(10) if !self.user_name}
	attr_accessor :password_confirmation
	validates  :email, presence: true, uniqueness: { message:" da duoc dang ki"}
	validates  :user_name,presence: true,uniqueness: {message: "da duoc dang ki"}
	validates_format_of :email,:with => /[a-zA-Z0-9\.\_]+@gmail.com/i
	validates_presence_of :name
	validates :password, presence: true , length: { in: 6..20},confirmation: true, :if => :password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://i.imgur.com/oDXDKXd.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	has_attached_file :wallpaper, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://i.imgur.com/AAPJNmU.jpg"
  validates_attachment_content_type :wallpaper, content_type: /\Aimage\/.*\z/
	
	has_many :articles,dependent: :destroy

	has_many :comments,dependent: :destroy


	has_many :add_friends,class_name: "Friendship", dependent: :destroy, foreign_key: :follower_id

	has_many :invite_friends,class_name: "Friendship",dependent: :destroy,foreign_key: :followed_id
	
	has_many :add_friends, -> { where.not( friendships: { status: :pending})}, through: :add_friends, source: :followed

	has_many :wait_friends,-> { where( friendships: { status: :pending})}, through: :add_friends, source: :followed
	
	
	has_many :messages
	has_many :chaters,dependent: :destroy
	has_many :talks,through: :chaters,dependent: :destroy
	def friends
		Friendship.where("follower_id = ? OR followed_id = ?",self.id,self.id)
	end
	# def friends
	# 	xfriends + yfriends
	# end
	# def wait_friends
	# 	x_wait_friends + y_wait_friends
	# end

	

end
