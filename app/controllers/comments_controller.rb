class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	def create


		@id=params[:post_id]
		@post = Post.find(@id)
		@comment=@post.comments.create(:body => params[:body] , :user_id => params['user_id'])

		if(@comment.save)
			redirect_to "/posts/#{@id}"
		
		end


	end
end
