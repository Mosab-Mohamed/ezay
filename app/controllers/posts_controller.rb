class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only =>[:create , :update]    


  def show
    if(@post == nil)
      redirect_to "/"
    end
  end

  def show_cat

      @posts = Post.where(:category => params[:cat] ,:kind => params[:kind])
      @cat = params[:cat]
      @user = false
      render 'index'
  end

  def write

  end 


  # GET /posts/1/edit
  def edit
    if(@post==nil || @post.user_id != current_user.id)

        render "/"
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
      @posts = Post.where(["title LIKE ?","%#{params[:q]}%"]) 
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

    def search_results
      @results = Array.new 
      @posts = Post.all
      @posts.each do |post|
        if post.title.index(params[:q])
          @results.push(post)
        end
      end
      return @results
    end


end
