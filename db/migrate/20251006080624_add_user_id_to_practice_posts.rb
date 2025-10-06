class AddUserIdToPracticePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :practice_posts, :user_id, :integer
  end
end
