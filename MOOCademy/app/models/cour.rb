class Cour < ApplicationRecord
	has_many :lessons
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
end
