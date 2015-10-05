class AnswersController < ApplicationController

  def index
    @answer = Answer.new
  end

  def show
    @answer = Answer.find params[:id]
  end

  def create
    load_question
    # Usually on a relation, use either .build or .create to make the proper object
    # with association
    # @question.answers.build/create(answers_params)
    # Answer.new
    # answers = []
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
    # You can leave this out - it should be implicit for rails to render a template
    # based on the controller/method
    # render '/answers/edit'
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    # I think better would be something like
    #
    # @question = @answer.question
    #
    # @question = Question.find(@answer[:question_id])
    if @answer.update_attributes answers_params
      redirect_to question_path(@question)
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
    @question = Question.find(params[:answer][:question_id])
  end

end
