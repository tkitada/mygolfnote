class CreatePracticePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :practice_posts do |t|

      t.timestamps
    end
  end
end
