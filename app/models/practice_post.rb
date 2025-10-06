class PracticePost < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image
  has_rich_text :content

end
