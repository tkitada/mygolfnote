class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all.order(created_at: :desc)
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "タグを作成しました"
    else
      @tags = Tag.all.order(created_at: :desc)
      render :index
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end

  private 

  def tag_params
    params.require(:tag).permit(:name)
  end
end
