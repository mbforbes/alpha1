class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_save { self.email = email.downcase }

	validates :mtgname, presence: true
	validates :realname, presence: true
	validates :email,
		presence: true,
		format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password_confirmation, presence: true
	validates :password, length: { minimum: 6 }

end
