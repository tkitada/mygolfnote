class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :practice_post
  
  after_create :create_notification

  private

  def create_notification
    Notification.create!(
      user: practice_post.user,
      notifiable: self,
      read: false
    )
  end
end
