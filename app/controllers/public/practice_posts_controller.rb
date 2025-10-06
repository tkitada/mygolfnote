class Public::PracticePostsController < ApplicationController
  def index
  end

  def new
    @practice_post = PracticePost.new
  end

  def create
    @practice_post = PracticePost.new(practice_post_params)
    @practice_post.user_id = current_user.id
    @practice_post.save
    redirect_to public_practice_posts_show_path
  end

  def show
  end

  def edit
  end

  private

  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end

end
