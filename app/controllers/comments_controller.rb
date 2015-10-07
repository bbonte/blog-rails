class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(comment_params)

    current_user.profile.comments.append @comment

    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:profile, :content)
    end
end
