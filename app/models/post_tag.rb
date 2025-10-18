class PostTag < ApplicationRecord
  belongs_to :practice_post
  belongs_to :tag
end
