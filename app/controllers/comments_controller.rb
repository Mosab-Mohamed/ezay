class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	def create


		@id=params[:post_id]
		@post = Post.find_by_id(@id)
		if(@post!= nil)
			@comment=@post.comments.create(:body => params[:body] , :user_id => current_user.id)

			if(@comment.save)
				####Notifactions teller####
					if (@post.user_id != @comment.user_id)
						@user = User.find(@post.user_id)
						@user.notifications.create(:comment_id => @comment.id )
					end
				#########
				respond_to do |f|
					f.js {render "posts/newComment"}
				end 
			end
		end
	end

	def delete
		@comment = current_user.comments.find_by_id(params[:comment_id])
		@post = Post.find_by_id(params[:post_id])
		if(current_user.id == @post.user_id)
			@comment = @post.comments.find_by_id(params[:comment_id])
		end
			
		if(@comment != nil)
			@comment.destroy

			respond_to do |f|
				f.js {render 'posts/removeComment'}
			end 
		end	

	end
end
