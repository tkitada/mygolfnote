module Public::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when Favorite
      "#{notifiable.user.name}さんがあなたの投稿にいいねしました"
    when PostComment
      "#{notifiable.user.name}さんがあなたの投稿にコメントしました"
    when Permit
      "#{notifiable.user.name}さんが#{notifiable.group.name}に参加申請しました"
    when GroupUser
      "あなたのグループ参加が承認されました"
    when Group
      "#{notifiable.name} グループからメールが届きました"
    else
      "新しい通知があります"
    end
  end
end
