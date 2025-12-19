class AddIndexToHoleScores < ActiveRecord::Migration[6.1]
  def change
    add_index :hole_scores, [:score_id, :hole_number], unique: true
  end
end
