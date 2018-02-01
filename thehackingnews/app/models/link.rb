class Link < ApplicationRecord
	belongs_to :user
	validates :url, presence :true
	validates :linker, presence :true

end
