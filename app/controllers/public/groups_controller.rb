class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
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
      render :new, alert: "空のフォームがあります"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "情報の更新に成功しました"
    else
      render "edit", alert: "空のフォームがあります"
    end
  end

  def permits
    @group = Group.find(params[:group_id])
    @permits = @group.permits
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group)
    end
  end

  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    EventMailer.send_mail(@group, @mail_title, @mail_content).deliver_now

    group_users.each do |user|
      Notification.create!(
        user: user,
        notifiable: @group,
      )
    end
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
end
