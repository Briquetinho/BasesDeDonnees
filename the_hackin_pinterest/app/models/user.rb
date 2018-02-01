class User < ApplicationRecord
	has_many :pins
	before_save {self.email = email.downcase}
	validates :username, presence: true, length: { maximum: 30}, uniqueness: {case_sensitive: false}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, length: { maximum: 255},
					uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6}
end
