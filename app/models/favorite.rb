class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :practice_post
end
