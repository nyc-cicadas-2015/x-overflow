class CommentsController < ApplicationController

  def new
   @question = Question.find_by(id: params[:question_id])
   @comment = Comment.new
  end

  def create
   if params[:comment][:commentable_type]
     question = Question.find(params[:comment][:commentable_id])
     comment = question.comments.build(comment_params)
     comment.user_id = current_user.id
     if comment.save
       flash[:alert] = "Success! Your comment has saved!"
     else
       flash[:error] = "Your comment must include text"
     end

   # elsif params[:answer_id]
   #   @answer = Answer.find_by(id: params[:answer_id])
   #   @comment = @answer.comments.build(comment_params.merge(user: current_user))
   #   if comment.save
   #     flash[:alert] = "Success! Your comment has saved!"
   #   else
   #     flash[:notice] = "Your comment must include text"
   #   end
   #   redirect_to question_path @answer.question
    redirect_to question_path(question)
   end
  end

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

end
