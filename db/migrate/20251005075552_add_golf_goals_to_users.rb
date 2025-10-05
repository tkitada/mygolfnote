class AddGolfGoalsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :golf_goals, :text
  end
end
