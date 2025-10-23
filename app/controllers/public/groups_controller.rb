class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :permits]
  before_action :set_user, only: [:show, :edit, :update, :permits]

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
      @group.users << current_user
      redirect_to groups_path, method: :post, notice: "グループを作成しました"
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

  def permits
    @permits = @group.permits.page(params[:page])
  end

  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    EventMailer.send_mail(@group, @mail_title, @mail_content).deliver_now
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group)
    end
  end

  def set_user
    @group = Group.find(params[:id])
  end
end
