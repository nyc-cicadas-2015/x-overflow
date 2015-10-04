class VotesController < ApplicationController

  def create
    @vote = Vote.create(user_id: params[:user_id], voteable_type: params[:votable_type], voteable_id: params[:voteable_id], votable_direction: params[:votable_direction])
    if vote.voteable_type == "Question"
      redirect_to question_path(id: vote.voteable_id)
    else
      redirect_to question_path(Comment.find(vote.voteable).commentable)
    end

  end

#   def create
#     if params[:question_id]
#       @question = Question.find_by(id: params[:question_id])
#       @vote = @question.votes.build(vote_params.merge(user: current_user))
#       if @vote.save
#         redirect_to question_path(@question)
#       else
#         flash[:notice] = 'Your vote has failed'
#       end
#     elsif params[:answer_id]
#       @answer = Answer.find_by(id: params[:answer_id])
#       @vote = @answer.votes.build(vote_params.merge(user: current_user))
#       if @vote.save
#         redirect_to question_path(@answer.question)
#       else
#         flash[:notice] = 'Your vote has failed'
#       end
#     end
#   end

#   private

#     def vote_params
#       params.require(:vote).permit(:question_id, :answer_id, :votable_direction)
#     end

end
