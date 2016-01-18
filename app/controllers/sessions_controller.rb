class SessionsController < ApplicationController

	def new

	end


	def create_smuggler_session

		@smuggler = Smuggler.where(username: params[:username]).first
		if @smuggler && @smuggler.authenticate(params[:password])
			session[:smuggler_id] = @smuggler.id
			redirect_to @smuggler
			flash[:notice] = "Your smuggler has been signed in."
		else
			redirect_to :back
			flash[:alert] = "We were unable to sign you in."
			
		end
	end




	def destroy_session

			session[:smuggler_id] = nil
			session[:tycoon_id] = nil
			flash[:notice] = "You have been logged out."
			redirect_to :back

	end

	def create_tycoon_session

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

	# def destroy_tycoon_session

	# 		session[:tycoon_id] = nil
	# 		flash[:notice] = "You have been logged out."
	# 		redirect_to root_path

	# end
end
