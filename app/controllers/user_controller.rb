class UserController < ApplicationController

	def home
		@posts = current_user.posts
		@user = true 
		render 'posts/index'
	end


end
