class CommentsController < ApplicationController

  def new
   @question = Question.find_by(id: params[:question_id])
   @comment = Comment.new
  end

  def create
    # Took a stab at a refactor:
    #
    comment = commentable.comments.build(comment_params.merge(user_id: current_user.id))
    if comment.save
      flash[:alert] = "Success! Your comment has saved!"
    else
      flash[:error] = "Your comment must include text"
    end
    # Question / Answer??
    redirect_to question_path(commentable.question)

   # if params[:comment][:commentable_type] == "Question"
   #   question = Question.find(params[:comment][:commentable_id])
   #   comment = question.comments.build(comment_params)
   #   comment.user_id = current_user.id
   #   if comment.save
   #     flash[:alert] = "Success! Your comment has saved!"
   #   else
   #     flash[:error] = "Your comment must include text"
   #   end
   # elsif params[:comment][:commentable_type] == "Answer"
   #   answer = Answer.find(params[:comment][:commentable_id])
   #   question = Question.find(answer.question_id)
   #   comment = answer.comments.build(comment_params)
   #   comment.user_id = current_user.id
   #   if comment.save
   #     flash[:alert] = "Success! Your comment has saved!"
   #   else
   #     flash[:notice] = "Your comment must include text"
   #   end
   # end
   end

  # Might be a good place to refactor here as well:
  def destroy
   comment = Comment.find(params[:id])
   if comment.commentable_type == "Question"
     @question = Question.find_by(id: comment.commentable_id)
   elsif comment.commentable_type == "Answer"
     @answer = Answer.find_by(id: comment.commentable_id)
   end
   comment.destroy
   redirect_to question_path @question
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

  # I love tests!!
  def commentable
    klass = params[:comment][:commentable_type].classify.constantize
    klass.find(params[:comment][:commentable_id])
  end
end
