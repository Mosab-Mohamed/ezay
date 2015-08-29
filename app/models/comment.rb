class Comment < ActiveRecord::Base

	belongs_to :post 
	belongs_to :user 
	has_many :notifications , dependent: :destroy
end
add