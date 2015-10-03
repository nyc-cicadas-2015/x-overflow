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
      render :partial => 'shared/errors', flash: {error: "Your answer must include text."}
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    render :partial => 'form', :locals => { :answer => @answer }
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes answers_params
      redirect_to answer_path(@answer)
    else
      render :partial => 'shared/errors'
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
