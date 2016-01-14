class MissionsController < ApplicationController
	
	def index
		@mission = Mission.all
	end

	def new
		@mission = Mission.new
	end

	def create
		@mission = Mission.new(mission_params)
	end

	def show

		@mission = Mission.find(params[:id])

	end

	

	def edit
		@mission = Mission.find(params[:id])
	end

	def update
		@mission = Mission.find(params[:id])
	end

	def destroy
		@mission = Mission.find(params[:id])
	end

	private

	def mission_params

	params.require(:mission).permit(:cost, :cargo, :origin, :destination, :name, :vehicle_id)
	end

end
