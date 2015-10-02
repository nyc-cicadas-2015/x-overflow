class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user.try(:authenticate, session_params[:password])
      flash[:message] = "Welcome #{user.username}"
      session[:user_id] = user.id
    else
      flash[:error] = 'Incorrect username or password, please try again'
    end
    redirect_to root_path
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end

end
