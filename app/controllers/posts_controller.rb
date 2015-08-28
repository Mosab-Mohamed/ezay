class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only =>[:create , :update]    


  def show
    if(@post == nil || !@post.user.access)
      redirect_to "/"
    else

      @comments = Array.new
      @post.comments.reverse.each do |comment|
           if(User.find_by_id(comment.user_id).access)
              @comments << comment
           end 
      end

      respond_to do |f|
        f.html {}
        f.js {render 'posts/updatePost'}
      end 
    end
  end

  def show_cat

      @Allposts = Post.where(:category => params[:cat] ,:kind => params[:kind])
      @posts = Array.new
      @Allposts.each do |p|
        if (p.user.access)
          @posts << p
        end
      end
      @cat = params[:cat]
      @user = false
      render 'index'
  end

  def write

  end 


  # GET /posts/1/edit
  def edit
    if(!@post.user.access)
        redirect_to "/"
    elsif(@post==nil || @post.user_id != current_user.id)
        render 'show'
    else
      respond_to do |f|
        f.js {render 'posts/editPost'}
      end 
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build ({:title => params[:title],:body => params[:body],:category => params[:category] ,:kind => params[:kind]})

    if(@post.save)
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to '/'
    end    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

      @post = Post.find_by_id(params[:id])
      if(@post != nil && @post.user_id == current_user.id )
        if @post.update(post_params)
          redirect_to @post
        end
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if(@post !=nil)
      @post.destroy
      redirect_to "/posts/show_cat/#{@post.category}?kind=#{@post.kind}"
    else
      redirect_to "/"
    end
  end

  #GET/posts/search
  def search
      @AllSearchposts = Post.where(["title LIKE ?","%#{params[:q]}%"]) 
      @posts = Array.new
      @AllSearchposts.each do |p|
        if (p.user.access)
          @posts << p
        end
      end
      @user = true 
      render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.permit(:title, :body , :category , :kind)
    end

end
