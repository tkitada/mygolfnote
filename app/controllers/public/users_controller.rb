class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :confirm]

  def index
  end

  def show
    @practice_posts = @user.practice_posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
  end

  def unsubscribe
    @user = current_user
    @user.update(is_active: false)
    sign_out @user
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :best_score, :average_score, :golf_experience, :golf_goals, :email, :profile_image)
  end
end
