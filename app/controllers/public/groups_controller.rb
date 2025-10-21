class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index

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
      redirect_to user_groups_path, method: :post_comments
    else
      render :new
    end
  end

  def edit
  end
end
