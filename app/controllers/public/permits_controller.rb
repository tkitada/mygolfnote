class Public::PermitsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    permit = current_user.permits.new(group_id: params[:group_id])
    permit.save
    redirect_to request.referer, notice: "参加申請を完了しました"
  end

  def destroy
    permit = current_user.permits.find_by(group_id: params[:group_id])
    permit.destroy
    redirect_to request.referer, alert: "参加申請を取り消しました"
  end
end
