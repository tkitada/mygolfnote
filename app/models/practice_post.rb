class PracticePost < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image
  has_rich_text :content

  validates :practice_date, :content, presence: :true

end
