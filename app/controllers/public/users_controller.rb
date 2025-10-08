class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :confirm]

  def index
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_mypage_path(@user)
  end

  def confirm
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :best_score, :average_score, :golf_experience, :golf_goals, :email, :profile_image)
  end
end
