class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_smuggler, :logged_in?
  helper_method :current_tycoon, :logged_in_ty?
  # Defined helper methods above check to make sure that a smuggler or a tycoon are logged in.
  
  def current_smuggler
  		@current_smuggler ||= Smuggler.find_by_id(session[:smuggler_id])
      # sets current_smuggler instance variable to the session for the smuggler 
  end

  def current_tycoon
      @current_tycoon ||= Tycoon.find_by_id(session[:tycoon_id])
      # same as above
  end

  def logged_in?
       current_smuggler != nil
       # if current_smuggler does not equal nil this returns true. Same for the tycoon version.
  end
        
  def logged_in_ty?
       current_tycoon != nil
  end
  
end
