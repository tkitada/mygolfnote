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
    @practice_post = current_user.practice_posts.find(params[:id])
  end

  def update
    @practice_post = current_user.practice_posts.find(params[:id])
    if @practice_post.update(practice_post_params)
      redirect_to practice_post_path(@practice_post)
    else
      render :edit
    end
  end

  def destroy
    @practice_post = current_user.practice_posts.find(params[:id])
    @practice_post.destroy
    redirect_to users_golfnotes_path
  end

  private

  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end

end
