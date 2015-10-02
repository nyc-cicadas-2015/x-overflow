class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end

  def show
    @answer = Answer.find params[:id]
  end

  def create

  end

  private

  def answers_params
    params.require(:answer).permit(:text)
  end

end
