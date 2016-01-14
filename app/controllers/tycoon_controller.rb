class TycoonController < ApplicationController
	def index

	end

	def new
		@tycoon = Tycoon.new
	end

	def create
		@tycoon = Tycoon.new(tycoon_params)
		if @tycoon.save
			redirect_to :back
			flash[:notice] = "New Tycoon Created!"
		else
			redirect_to :back
			flash[:notice] = "We could not create your Tycoon. Please try again."
		end
	end

	def update

	end

	def destroy

	end

	private


	def tycoon_params

		params.require(:tycoon).permit(:username, :email, :password, :home, :cigar, :networth)
	end
end
