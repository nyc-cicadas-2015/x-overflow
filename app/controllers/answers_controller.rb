class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end
end
