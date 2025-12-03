class AddGeocodingColumnToPracticePost < ActiveRecord::Migration[6.1]
  def change
    add_column :practice_posts, :address, :string, null: false, default: ""
    add_column :practice_posts, :latitude, :float, null: false, default: 0
    add_column :practice_posts, :longitude, :float, null: false, default: 0
  end
end
