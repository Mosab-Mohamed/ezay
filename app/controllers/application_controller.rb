class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action  :listCategories 

  def recommended_posts
	  $rec_posts = Post.where(:category => current_user.department).where.not(:user_id => current_user.id)
    current_user.followeds.each do |followed|
      
      $rec_posts.concat(User.find_by_id(followed.followed_id).posts.where.not(:category => current_user.department))   
    end
    $rec_posts=$rec_posts.sort_by{|has| has[:likes] }.uniq.reverse[0..2]
   
  end

  def listCategories
     @categories = Category.all 
  end

  helper_method :recommended_posts 
end
