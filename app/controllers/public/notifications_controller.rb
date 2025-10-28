class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!


  def update
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    notifiable = @notification.notifiable

    if notifiable.nil?
      redirect_to root_path, alert: "リンク先が見つかりませんでした"
      return
    end

    case @notification.notifiable_type
    when "PostComment"
      redirect_to practice_post_path(notifiable.practice_post)
    when "Favorite"
      redirect_to practice_post_path(notifiable.practice_post)
    when "Permit"
      redirect_to group_path(notifiable.group)
    when "GroupUser"
      redirect_to group_path(notifiable.group)
    when "GroupMail"
      redirect_to group_path(notifiable.group)
    else
      redirect_to root_path, alert: "リンク先が見つかりませんでした"
    end
  end

end
