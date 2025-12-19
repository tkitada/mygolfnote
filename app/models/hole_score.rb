class HoleScore < ApplicationRecord
  belongs_to :score

  validates :hole_number, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..18 }, uniqueness: { scope: :score_id }
  validates :strokes, numericality: { only_integer: true }, allow_nil: true
  validates :putts, numericality: { only_integer: true }, allow_nil: true
end
