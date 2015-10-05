class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # I think I'd prefer to create the methods in the ApplicationController, and
  # then use `helper_method' to make them helper methods
  #
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  # helper_method :current_user
end
