class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :practice_post
  has_one :notifications, as: :notifiable, dependent: :destroy
end
