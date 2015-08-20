class Comment < ActiveRecord::Base

	belongs_to :post
	has_many :notifications , dependent: :destroy
end
