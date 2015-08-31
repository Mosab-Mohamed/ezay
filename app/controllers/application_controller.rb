class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action  :listCategories 

  def recommended_posts
	  $rec_posts = Post.where(:category => current_user.department).where.not(:user_id => current_user.id).order("comments_length+likes DESC");
  end

  def listCategories
     @categories = Category.all 
  end

  helper_method :recommended_posts 
end
