class Score < ApplicationRecord
  belongs_to :user
  has_many :hole_scores, dependent: :destroy

  validates :date, presence: true
  accepts_nested_attributes_for :hole_scores #Score 保存時にhole_scores_attributes を一緒に保存できるようにする
end
