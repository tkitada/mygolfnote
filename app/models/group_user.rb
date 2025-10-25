class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create :notify_approval

  private

  def notify_approval
    Notification.create!(
      user: user,
      notifiable: self,
      read: false
    )
  end
end
