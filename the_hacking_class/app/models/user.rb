class User < ApplicationRecord
	belongs_to :cour
	validates :pseudo, presence: true, length: { in: 4...12 }, uniqueness: true
	validates :firstname, presence: true, length: { maximum: 30}
	validates :lastname, presence: true, length: { maximum: 30}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6}
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, length: { maximum: 30},
				uniqueness: {case_sensitive: false}
end
