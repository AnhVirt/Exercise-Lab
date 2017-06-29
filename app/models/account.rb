class Account < ApplicationRecord
	
	validates  :email, presence: true, uniqueness:{ messenger:"Email da duoc dang ki"}
	validates_presence_of :first_name, :last_name
	validates :password, presence: true , length: { in: 6..20}
	  has_secure_password
	
end
