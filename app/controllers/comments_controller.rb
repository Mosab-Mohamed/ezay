class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	def create


		@id=params[:post_id]
		@post = Post.find_by_id(@id)
		if(@post!= nil)
			@comment=@post.comments.create(:body => params[:body] , :user_id => current_user.id)

<<<<<<< HEAD
		if(@comment.save)
			####Notifactions teller####
				if (@post.user_id != @comment.user_id)
					@user = User.find(@post.user_id)
					@user.notifications.create(:comment_id => @comment.id )
				end
			########
			redirect_to "/posts/#{@id}"
=======
			if(@comment.save)
				redirect_to "/posts/#{@id}"
			end
>>>>>>> e00b3c1ca5ff1317e6b83bc52ed91c9eae3e886d
		end
	end

	def delete

		@comment = current_user.comments.find_by_id(params[:comment_id])

		if(@comment != nil)
			@comment.destroy
		end
		redirect_to "/posts/#{params['post_id']}"

	end
end
