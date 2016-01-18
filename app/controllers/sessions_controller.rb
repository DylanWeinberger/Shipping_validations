class SessionsController < ApplicationController

	def new

	end


	def create_smuggler_session
		# This will find the smuggler with the username entered and set it to the @smuggler variable.
		@smuggler = Smuggler.where(username: params[:username]).first
		if @smuggler && @smuggler.authenticate(params[:password])
			# the above uses the bcrypt authentication of password.
			session[:smuggler_id] = @smuggler.id
			# sets the session id to the id of the smuggler.
			redirect_to @smuggler
			# redirects to smugglers page and sends them a notice.
			flash[:notice] = "Your smuggler has been signed in."
		else
			# If it doesn't work it redirects back and alerts user.
			redirect_to :back
			flash[:alert] = "We were unable to sign you in."
		end
	end
	
	def destroy_session
			# this will destroy either a smuggler session or a tycoon session alert them and redirect them back.
			session[:smuggler_id] = nil
			session[:tycoon_id] = nil
			flash[:notice] = "You have been logged out."
			redirect_to :back

	end

	def create_tycoon_session
		# exactly the same as the create session above but with tycoon instead.
		@tycoon = Tycoon.where(username: params[:username]).first
		if @tycoon && @tycoon.authenticate(params[:password])
			session[:tycoon_id] = @tycoon.id
			redirect_to @tycoon
			flash[:notice] = "Your Tycoon has been signed in."
		else
			
			redirect_to :back
			flash[:alert] = "We were unable to sign you in."
		end
	end
end
