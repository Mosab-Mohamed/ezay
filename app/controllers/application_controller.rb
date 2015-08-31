class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def recommended_posts
	  $rec_posts = Post.where(:category => current_user.department).order("comments_length DESC");
  end

  def sort

  end

  helper_method :recommended_posts 
end
