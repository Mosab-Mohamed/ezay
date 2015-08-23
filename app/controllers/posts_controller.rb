class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :create   


  def show
  end

  def show_cat

      @posts = Post.where(:category => params[:cat] ,:kind => params[:kind])
      @cat = params[:cat]
      @user = false
      render 'index'
  end

 

  # GET /posts/1/edit
  def edit
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET/posts/search
  def search
      @posts = search_results
      @user = true 
      render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body , :category)
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
