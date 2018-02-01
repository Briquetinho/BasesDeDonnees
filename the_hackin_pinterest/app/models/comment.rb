class Comment < ApplicationRecord
	belongs_to :pin
	validates :commentaire, presence: true,
	length: { maximum: 150 }
end
