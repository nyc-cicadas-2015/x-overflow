class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end

  def show
    @answer = Answer.find params[:id]
  end

  def create
    load_question
    answer = @question.answers.new(answers_params)
    answer.user_id = current_user.id
    if answer.save
      redirect_to question_path(@question)
    else
      redirect_to new_answer_path, flash: {error: "Your answer must include text."}
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to root_path
  end

  private

  def answers_params
    params.require(:answer).permit(:text)
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

end
