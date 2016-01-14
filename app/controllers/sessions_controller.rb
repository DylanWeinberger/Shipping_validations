class SessionsController < ApplicationController

	def new

	end


	def create_smuggler_session

		@smuggler = Smuggler.where(email: params[:email]).first
		if @smuggler && @smuggler.password == params[:password]
			session[:smuggler_id] = @smuggler.id
			redirect_to @smuggler
			flash[:notice] = "Your smuggler has been signed in."
		else
			flash[:alert] = "We were unable to sign you in."
			redirect_to root_path
		end
	end

	def destroy_smuggler_session

			session[:smuggler_id] = nil
			flash[:notice] = "You have been logged out."
			redirect_to root_path

	end

	def create_tycoon_session

		@tycoon = Tycoon.where(email: params[:email]).first
		if @tycoon && @tycoon.password == params[:password]
			session[:tycoon_id] = @tycoon.id
			redirect_to root_path
			flash[:notice] = "Your Tycoon has been signed in."
		else
			flash[:alert] = "We were unable to sign you in."
			redirect_to root_path
		end
	end

	def destroy_tycoon_session

			session[:tycoon_id] = nil
			flash[:notice] = "You have been logged out."
			redirect_to root_path

	end
end
