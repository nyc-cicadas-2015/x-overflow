class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user
      log_in(user)
      flash[:message] = "Welcome #{user.username}"
    else
      flash[:error] = 'Incorrect username or password, please try again'
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = "You've been signed out.  See you next time!"
    redirect_to root_path
  end

end
