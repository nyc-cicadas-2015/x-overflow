class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end

  def show
    @answer = Answer.find params[:id]
  end
end
