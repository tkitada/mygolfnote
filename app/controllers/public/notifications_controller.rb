class Public::NotificationsController < ApplicationController
  before_action :autheticate_user!


  def update
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    redirect_to @notification.notifiable #通知元のオブジェクトへ
  end

end
