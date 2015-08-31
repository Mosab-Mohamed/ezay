class CommentsController < ApplicationController
	 skip_before_filter :verify_authenticity_token, :only => :create 
	before_action  :get_comment, :rating ,:only => [:like , :dislike]
	before_action :authenticate_user!	

	def create
		@id=params[:post_id]
		@post = Post.find_by_id(@id)
		if(@post!= nil)
			@comment=@post.comments.create(:body => params[:body] , :user_id => current_user.id)

			if(@comment.save)
					@post.update_attribute(:comments_length,@post.comments.length)
				####Notifactions teller####
					if (@post.user_id != @comment.user_id)
						@user = User.find(@post.user_id)
						@user.notifications.create(:post_id => @id ,:writer_id => current_user.id , :action => "commented on")
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

	def like

		if !@positiveRating || @negativeRating
			@comment.update_attribute(:rating , @comment.rating+1)

			if(@negativeRating)
				current_user.likes.where(:rated_id => params[:id] , :category => "-comment").first.destroy	
			else
				current_user.likes.create(:rated_id => params[:id] , :category => "+comment")
			end
			respond_to do |f|
        		f.js {render 'posts/updateCommentRating'}
      		end
		end	
	end

	def dislike

		if @positiveRating || !@negativeRating
			@comment.update_attribute(:rating , @comment.rating-1)

			if(@positiveRating)
				current_user.likes.where(:rated_id => params[:id] , :category => "+comment").first.destroy	
			else
				current_user.likes.create(:rated_id => params[:id] , :category => "-comment")
			end

			respond_to do |f|
        		f.js {render 'posts/updateCommentRating'}
      		end
		end 

	end

	private 

	def get_comment
		@comment = Comment.find_by_id(params[:id])
	end

	def rating
		@positiveRating = ratedComment(params[:id],"+comment")
		@negativeRating = ratedComment(params[:id],"-comment") ; 
	end
	
	def ratedComment (commentId,cat)

      if current_user.likes.where(:rated_id => commentId , :category => cat).length != 0 
        true
      else
        false
      end

  	end
end
