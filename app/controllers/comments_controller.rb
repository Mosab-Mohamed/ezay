class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	def create


		@id=params[:post_id]
		@post = Post.find_by_id(@id)
		if(@post!= nil)
			@comment=@post.comments.create(:body => params[:body] , :user_id => current_user.id)

			if(@comment.save)
				redirect_to "/posts/#{@id}"
			end
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
