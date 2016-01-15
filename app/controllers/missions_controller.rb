class MissionsController < ApplicationController
	
	def index
		@missions = Mission.all
	
	end

	def new
		@mission = Mission.new
		@vehicles = Vehicle.all
	end

	def create
		@mission = Mission.new(mission_params)
		@mission.smuggler_id = session[:smuggler_id]
		if @mission.save
			flash[:notice] = "Your mission was saved"
			redirect_to root_path
		else
			flash[:notice] = "Your mission was not saved"
			redirect_to root_path
		end
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
		@mission.destroy
	end

	private

	def mission_params

	params.require(:mission).permit(:cost, :cargo, :origin, :destination, :name, :vehicle_id)
	end

end
