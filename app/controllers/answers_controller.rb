class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end

  def show
    @answer = Answer.find params[:id]
  end

  def create
    @answer = Answer.new answers_params
    if @answer.save
      redirect_to answer(@answer)
    else
      render :edit
    end
  end

  private

  def answers_params
    params.require(:answer).permit(:text)
  end

end
