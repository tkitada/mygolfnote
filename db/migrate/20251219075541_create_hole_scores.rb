class CreateHoleScores < ActiveRecord::Migration[6.1]
  def change
    create_table :hole_scores do |t|
      t.references :score, null: false, foreign_key: true
      t.integer :hole_number, null: false
      t.integer :par
      t.integer :strokes
      t.integer :putts

      t.timestamps
    end
  end
end
