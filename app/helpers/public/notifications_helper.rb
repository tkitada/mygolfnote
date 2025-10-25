module Public::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Favorite"
      "#{notification.notifiable.user.name}さんがあなたの投稿にいいねしました"
    when "PostComment"
      "#{notification.notifiable.user.name}さんがあなたの投稿にコメントしました"
    when "Permit"
      "#{notification.notifiable.user.name}さんが#{notification.notifiable.group.name}に参加申請しました"
    when "GroupUser"
      "あなたのグループ参加が承認されました"
    when "Group"
      "#{notification.notifiable.name} グループからメールが届きました"
    else
      "新しい通知があります"
    end
  end
end
