class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @practice_post = PracticePost.find(params[:practice_post_id])
    favorite = current_user.favorites.new(practice_post_id: @practice_post.id)
    favorite.save
  end

  def destroy
    @practice_post = PracticePost.find(params[:practice_post_id])
    favorite = current_user.favorites.find_by(practice_post_id: @practice_post.id)
    favorite.destroy if favorite.present?
  end
end
