class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.find(session[:id]) if session[:id] #Set current_user to the session ID if that ID is in session.
  end
  helper_method :current_user #helper_method lets you use throughout  

end
