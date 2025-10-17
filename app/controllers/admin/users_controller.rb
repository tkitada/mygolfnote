class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "情報を更新しました"
      redirect_to admin_user_path(@user)
    else
      flash.now[:alert] = "情報の更新に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
end
