class Public::PracticePostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_practice_post, only: [:edit, :update, :destroy]

  def index
    @tag_list = Tag.all
    @practice_posts = PracticePost.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @practice_post = PracticePost.new
  end

  def create
    @practice_post = current_user.practice_posts.build(practice_post_params)
    tag_list = params[:practice_post][:name].split(',')
    if @practice_post.save
      @practice_post.save_tags(tag_list)
      redirect_to practice_post_path(@practice_post)
    else
      render :new
    end
  end

  def show
    @practice_post = PracticePost.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
    tag_list = params[:practice_post][:name].split(',')
    if @practice_post.update(practice_post_params)
      @old_relations = PostTag.where(practice_post: @practice_post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @practice_post.save_tags(tag_list)
      redirect_to practice_post_path(@practice_post)
    else
      render :edit
    end
  end

  def destroy
    @practice_post.destroy
    redirect_to user_path(current_user)
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find_by(id: params[:tag_id])
    @practice_posts = @tag.practice_posts
  end

  private

  def set_practice_post
    @practice_post = current_user.practice_posts.find_by(id: params[:id])
    unless @practice_post
      redirect_to root_path
    end
  end


  def practice_post_params
    params.require(:practice_post).permit(:practice_date, :practice_focus, :shot_hits, :content)
  end


end
