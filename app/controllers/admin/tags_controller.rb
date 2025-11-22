class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all.order(created_at: :desc)
  end

  def edit
  end
end
