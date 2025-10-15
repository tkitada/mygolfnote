class CreatePostcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :postcomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :practice_post_id

      t.timestamps
    end
  end
end
