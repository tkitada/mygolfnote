class Public::FavoritesController < ApplicationController
  def create
    practice_post = PracticePost.find(params[:practice_post_id])
    favorite = current_user.favorites.new(practice_post_id: practice_post.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    practice_post = PracticePost.find(params[:practice_post_id])
    favorite = current_user.favorites.find_by(practice_post_id: practice_post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
