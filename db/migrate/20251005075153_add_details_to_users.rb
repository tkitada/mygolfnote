class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :best_score, :integer
    add_column :users, :average_score, :integer
    add_column :users, :golf_experience, :integer
  end
end
