class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_smuggler, except: [:destroy]

  
  def current_smuggler
	if session[:smuggler_id]
  		@current_smuggler = Smuggler.find(session[:smuggler_id])
  	end
  end

  def current_tycoon
	if session[:tycoon_id]
  		@current_tycoon = tycoon.find(session[:tycoon_id])
  	end
  end
end
