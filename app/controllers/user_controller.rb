class UserController < ApplicationController

	def home
		@posts = current_user.posts
		@user = true 
		render 'posts/index'
	end

	def deactivate
		current_user.update_attribute(:access , false) ;
		redirect_to destroy_user_session_path ;
	end


end
