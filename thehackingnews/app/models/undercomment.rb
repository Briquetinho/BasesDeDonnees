class Undercomment < ApplicationRecord
	belongs_to :comment
	validates :content, presence: true
	validates :commenter, presence: true
end
