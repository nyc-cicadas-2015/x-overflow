class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @question = Question.new
    @questions = Question.order_by_recent
  end

# def trending
#     @question = Question.order_by_trending
#     render :index
#   end

#   def votes
#     @questions = Question.order_by_votes
#     render :index
#   end

#   def search
#     @questions = Question.where("title ILOOK ?", "%#{params[:search]}%")
#     @questions.order_by_recent
#     render :index
#   end

  def show
    @comments = @questions.comments
    @answers = @question.answers.includes(:comments)
    @vote = Vote.new
    @answer = Answer.new
    @comment = Comment.new
  end



end
