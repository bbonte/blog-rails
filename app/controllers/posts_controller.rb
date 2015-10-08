class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if current_user.profile != @post.profile
     redirect_to root_path, alert: 'You are not authorized to edit this post.'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.profile = current_user.profile

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if current_user.profile == @post.profile
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if current_user.profile == @post.profile
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    else
      redirect_to posts_url, alert:'You are not authorized to delete this post.'
    end
  end

  def toggle_like
    @profile = current_user.profile
    @post = Post.find(params[:id])

    if @profile.likes.include?(@post)
      @profile.likes.delete @post
    else
      @profile.likes.append @post
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :avatar, :profile, :comments_attributes => [:content, :profile])
    end
end
