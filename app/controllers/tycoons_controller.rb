class TycoonsController < ApplicationController
	def index
		@tycoons = Tycoon.all
	end

	def show
		@tycoon = Tycoon.find(params[:id])
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
			@tycoon = Tycoon.find(params[:id])
			@tycoon.destroy
			redirect_to :back
			flash[:notice] = "Your FatCat was destroyed..."
	end

	private


	def tycoon_params

		params.require(:tycoon).permit(:username, :email, :password, :home, :cigar, :networth)
	end
end
