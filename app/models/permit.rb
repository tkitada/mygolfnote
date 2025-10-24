class Permit < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create :create_notification

  private

  def create_notification
    Notification.create!(
      user: group.owner,
      notifiable: self,
      read: false
    )
  end
end
