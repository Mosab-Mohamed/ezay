class UserController < ApplicationController

	def home
		@posts = current_user.posts.order("created_at DESC")
		@user = true 
		render 'posts/index'
	end

	def NewsFeed
		## posts from department and following ########################################
		@posts = Post.where(:category => current_user.department)
		################################################
		@user = true 
		render 'posts/index'
	end

	def deactivate
		current_user.update_attribute(:access , false) ;
		redirect_to destroy_user_session_path ;
	end

	def show_profile
		@id = params[:id]
		@user = User.find(@id)
		if (!@user.access)
			@bool = false
		else
			@bool = true
		end
		@posts = @user.posts.order("created_at DESC")
		render "show_profile"
	end
end
