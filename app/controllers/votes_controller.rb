class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  # def create
  #   if params[:question_id]
  #     @question = Question.find_by(id: params[:question_id])
  #     @vote = @question.votes.build(vote_params.merge(user: current_user))
  #     if @vote.save
  #       redirect_to question_path(@question)
  #     else
  #       flash[:notice] = 'Your vote has failed'
  #     end
  #   elsif params[:answer_id]
  #     @answer = Answer.find_by(id: params[:answer_id])
  #     @vote = @answer.votes.build(vote_params.merge(user: current_user))
  #     if @vote.save
  #       redirect_to question_path(@answer.question)
  #     else
  #       flash[:notice] = 'Your vote has failed'
  #     end
  #   end
  # end

  def create
   if params[:vote][:votable_type] == "Question"
     @question = Question.find(params[:vote][:votable_id])
     @vote = question.votes.build(cote_params)
     @vote.user_id = current_user.id
     if @vote.save
       redirect_to question_path(@question)
     else
       flash[:notice] = "Your vote has failed"
     end
   elsif params[:vote][:votable_type] == "Answer"
     @answer = Answer.find(params[:vote][:votable_id])
     @question = Question.find(answer.question_id)
     @vote = answer.votes.build(vote_params)
     @vote.user_id = current_user.id
     if @vote.save
       redirect_to question_path(@answer.question)
     else
       flash[:notice] = 'Your vote has failed'
     end
   end
 end

  private

  def vote_params
    params.require(:vote).permit(:votable_direction)
  end

end
