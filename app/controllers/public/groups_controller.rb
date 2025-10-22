class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save 
      redirect_to groups_path, method: :post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def set_user
    @group = Group.find(params[:id])
  end
end
