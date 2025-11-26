class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :practice_posts, through: :post_tags

  validates :name, length:{maximum:50}
end
