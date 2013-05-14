class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	has_many :shouts

	before_save { self.email = email.downcase }
	before_save :create_remember_token

	validates :mtgname, presence: true
	validates :realname, presence: true
	validates :email, presence: true,
	                  format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password_confirmation, presence: true
	validates :password, length: { minimum: 6 }


	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
