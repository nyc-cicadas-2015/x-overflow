class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @question = Question.new
    @questions = Question.order_by_recent
  end



end
