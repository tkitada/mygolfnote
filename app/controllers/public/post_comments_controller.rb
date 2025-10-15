class Public::PostCommentsController < ApplicationController
  def create
    practice_post = PracticePost.find(params[:practice_post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.practice_post_id = practice_post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
