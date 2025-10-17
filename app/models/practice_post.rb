class PracticePost < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image
  has_rich_text :content

  validates :practice_date, :content, presence: :true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
