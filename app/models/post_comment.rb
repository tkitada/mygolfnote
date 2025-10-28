class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :practice_post
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :create_notification

  validates :comment, presence: true

  private

  def create_notification
    Notification.create!(
      user: practice_post.user,
      notifiable: self,
      read: false
    )
  end
end
