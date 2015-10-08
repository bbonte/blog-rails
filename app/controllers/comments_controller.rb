class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(comment_params)

    current_user.profile.comments.append @comment

    redirect_to post_path(@post)
  end

  # DELETE post/1/comments/1
  # DELETE post/1/comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if current_user.profile == @comment.profile
      @comment.destroy
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), alert: 'You are not authorized to delete this comment.'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:profile, :content)
    end
end
