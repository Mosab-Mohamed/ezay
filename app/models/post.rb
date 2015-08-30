class Post < ActiveRecord::Base

	belongs_to :user
	has_many :comments , dependent: :destroy
	has_many :notifications , dependent: :destroy
	validates :title ,presence: true 
end
