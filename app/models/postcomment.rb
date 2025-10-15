class Postcomment < ApplicationRecord
  belongs_to :user
  belongs_to :practice_post

  validates :comment, presence: true
end
