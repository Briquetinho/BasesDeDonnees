class Comment < ApplicationRecord
	belongs_to :link
	has_many :undercomments
	validates :content, presence: true 
	validates :commenter, presence: true 
end
