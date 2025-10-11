class Public::PracticePostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_practice_post, only: [:edit, :update, :destroy]

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
  end

  def update
    if @practice_post.update(practice_post_params)
      redirect_to practice_post_path(@practice_post)
    else
      render :edit
    end
  end

  def destroy
    @practice_post.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_practice_post
    @practice_post = current_user.practice_posts.find_by(id: params[:id])
    unless @practice_post
      redirect_to root_path
    end
  end


  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end


end
