class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]
    @search_method = params[:search_method]
  
    if @model == "User"
      @users = search_users(@search_method, @word)
    elsif @model == "PracticePost"
      @practice_posts = search_practice_posts(@search_method, @word)
    end
  end

  private

  def search_users(search_method, word)
    case search_method
    when "perfect"
      User.where(name: word)
    when "forward"
      User.where("name LIKE ?", "#{word}%")
    when "backward"
      User.where("name LIKE ?", "%#{word}")
    when "partial"
      User.where("name LIKE ?", "%#{word}%")
    else
      User.none
    end
  end

  def search_practice_posts(search_method, word)
    case search_method
    when "perfect"
      PracticePost.where(practice_focus: word)
    when "forward"
      PracticePost.where("practice_focus LIKE ?", "#{word}%")
    when "backward"
      PracticePost.where("practice_focus LIKE ?", "%#{word}")
    when "partial"
      PracticePost.where("practice_focus LIKE ?", "%#{word}%")
    else
      PracticePost.none
    end
  end

end
