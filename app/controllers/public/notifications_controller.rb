class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!


  def update
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    case @notification.notifiable
    when "PostComment"
      redirect_to practice_post_path(@notification.notifiable.practice_post)
    when "Favorite"
      redirect_to practice_post_path(@notification.notifiable.practice_post)
    when "Permit"
      redirect_to group_path(@notification.notifiable.group)
    when "GroupUser"
      redirect_to group_path(@notification.notifiable.group)
    when "GroupMail"
      redirect_to group_path(@notification.notifiable.group)
    else
      redirect_to root_path, alert: "リンク先が見つかりませんでした"
    end
  end

end
