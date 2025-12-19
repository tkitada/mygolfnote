class Public::ScoresController < ApplicationController
  before_action :authenticate_user!

  def index 
    @scores = current_user.scores.order(date: :desc)
  end

  def new
    @score = Score.new

    #build しないと fields_for が表示されない
    #hole_number をここで固定する
    18.times do |i|
      @score.hole_scores.build(hole_number: i + 1)
    end
  end

  def create
    @score = current_user.scores.build(score_params)
    if @score.save
      redirect_to scores_path(@score)
    else
      render :new
    end
  end

  private

  def score_params
    params.require(:score).permit(
      :date, 
      :course_name,
      #↓がないとHoleScoreは保存されない
      hole_scores_attributes: [
        :hole_number,
        :par,
        :strokes,
        :putts
      ]
    )
  end
end
