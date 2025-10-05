class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
  end

  def confirm
  end
end
