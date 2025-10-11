class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :confirm]

  def index
  end

  def show
    @practice_posts = @user.practice_posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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

  def is_matching_login_user
    user = User.find_by(id: params[:id])
    if user.nil? || user.id != current_user.id
      redirect_to root_path
    end
  end
    
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :best_score, :average_score, :golf_experience, :golf_goals, :email, :profile_image)
  end
end
