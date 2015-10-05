class VotesController < ApplicationController

  def new
    @vote = Vote.new
    @question = Question.find_by(id: params[:question_id])
  end

  def index
  end

  def create
   if params[:vote][:votable_type] == "Question"
     question = Question.find(params[:vote][:votable_id])
     vote = question.votes.build(vote_params)
     vote.user_id = current_user.id
     if vote.save
       redirect_to question_path(question)
     else
       flash[:notice] = "Your vote has failed"
     end
   elsif params[:vote][:votable_type] == "Answer"
     answer = Answer.find(params[:vote][:votable_id])
     question = Question.find(answer.question_id)
     vote = answer.votes.build(vote_params)
     vote.user_id = current_user.id
     if vote.save
       redirect_to question_path(answer.question)
     else
       flash[:notice] = 'Your vote has failed'
     end
  else
      redirect_to question_path(question)
   end
 end

  private

  def vote_params
    params.require(:vote).permit(:votable_direction)
  end

end
