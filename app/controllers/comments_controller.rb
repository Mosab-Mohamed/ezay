class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	def create


		@id=params[:post_id]
		@post = Post.find(@id)
		@comment=@post.comments.create(:body => params[:body] , :user_id => params['user_id'])

		if(@comment.save)
			####Notifactions teller####
				if (@post.user_id != @comment.user_id)
					@user = User.find(@post.user_id)
					@user.notifications.create(:comment_id => @comment.id )
				end
			########
			redirect_to "/posts/#{@id}"
		end


	end
end
