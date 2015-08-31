class UserController < ApplicationController
	before_action :following , :only => [:follow ,:unfollow , :show_profile ]

	def home
		@posts = current_user.posts.order("created_at DESC")
		@user = true 
		render 'posts/index'
	end

	def newsFeed
		
		allPosts = Post.where(:category => current_user.department)
		current_user.followeds.each do |followed|
			allPosts.concat(User.find_by_id(followed.followed_id).posts)	 
		end
		@posts = allPosts.sort_by{|has| has[:created_at]}.uniq.reverse[0..20]
		@user = true 
		render 'posts/index'
	end

	def deactivate
		current_user.update_attribute(:access , false) ;
		redirect_to destroy_user_session_path ;
	end

	def show_profile
		@user = User.find(@id)
		if (!@user.access)
			@bool = false
		else
			@bool = true
		end
		@posts = @user.posts.order("created_at DESC")
		render "show_profile"
	end

	def follow
		unless @following
			current_user.followeds.create(:followed_id => @id);
			respond_to do |f|
				f.js { render 'user/changeToUnfollow'}
			end

		end
	end

	def unfollow
		if @following
			@followedUser.destroy
			respond_to do |f|
				f.js { render 'user/changeToFollow'}
			end

		end	
	end

	private

	def following
		@id = params[:id]
		@followedUsers = current_user.followeds.where(:followed_id => @id) ;
		if @followedUsers.length != 0 || current_user.id == @id
			@following = true
			@followedUser = @followedUsers.first 
		else
			@following = false
		end
	end

end
