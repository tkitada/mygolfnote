class Public::PracticePostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @practice_posts = PracticePost.all
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
    redirect_to user_path(current_user)
  end

  private

  def is_matching_login_user
    unless @practice_post.user == current_user
      redirect_to root_path
    end
  end

  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end


end
