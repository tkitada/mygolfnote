class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.string :course_name

      t.timestamps
    end
  end
end
