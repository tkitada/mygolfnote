class AddDetailsToPracticePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :practice_posts, :title, :string
    add_column :practice_posts, :content, :text
    add_column :practice_posts, :practice_date, :date
    add_column :practice_posts, :practice_focus, :string
    add_column :practice_posts, :practice_type, :integer
    add_column :practice_posts, :shot_hits, :integer
  end
end
