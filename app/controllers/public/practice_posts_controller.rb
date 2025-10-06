class Public::PracticePostsController < ApplicationController
  def index
  end

  def new
    @practice_post = PracticePost.new
  end

  def create
    @practice_post = current_user.practice_posts.build(practice_post_params)
    if @practice_post.save
      redirect_to practice_post_path(@practice_post)
    else
      render :new
    end
  end

  def show
    @practice_post = PracticePost.find(params[:id])
  end

  def edit
  end

  private

  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end

end
