class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_smuggler, :logged_in?
  helper_method :current_tycoon, :logged_in_ty?

  
  def current_smuggler
  		@current_smuggler ||= Smuggler.find_by_id(session[:smuggler_id])
  end

  def current_tycoon
      @current_tycoon ||= Tycoon.find_by_id(session[:tycoon_id])
  end

  def logged_in?
       current_smuggler != nil
  end
        
  def logged_in_ty?
       current_tycoon != nil
  end
  
end
