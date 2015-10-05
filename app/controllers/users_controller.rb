class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @question = Question.find_by(user_id: @user.id)
    @comment = Comment.find_by(user_id: @user.id)
    @answer = Answer.find_by(user_id: @user.id)
  end

  def create
    user = User.new user_params
    if user.save
      log_in(user)
      redirect_to root_path
    else
      flash[:alert] = "You already exist, please login"
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
