class MissionsController < ApplicationController
	
	def index
		@missions = Mission.all
	
	end

	def new
		@mission = Mission.new
		@vehicles = Vehicle.all
		@smugglers = Smuggler.all
	end

	def create
		@mission = Mission.new(mission_params)
		if logged_in_ty?
			if @mission.origin != @mission.destination
				if @mission.save
					flash[:notice] = "Your mission was saved"
					redirect_to root_path
				else
					flash[:notice] = "Your mission was not saved"
					redirect_to root_path
				end
			else
				redirect_to :back
			end
		else
			redirect_to :back
			flash[:notice] = "Must be logged in as a Tycoon to create a Mission!"
		end	
	end

	def show

		@mission = Mission.find(params[:id])
		@smuggler_id = @mission.smuggler_id
		if Smuggler.find(@smuggler_id) 
			@smuggler = Smuggler.find(@smuggler_id) 
		else
			@smuggler = "Classified."
		end

	end

	

	def edit
		@mission = Mission.find(params[:id])
	end

	def update
		@mission = Mission.find(params[:id])
	end

	def destroy
		if logged_in_ty
			@mission = Mission.find(params[:id])
			@mission.destroy
			redirect_to missions_path
		else
			redirect_to :back
			flash[:notice] = "You must be a Tycoon to cancel a mission."
		end
	end

	private

	def mission_params

	params.require(:mission).permit(:cost, :cargo, :origin, :destination, :name, :vehicle_id, :smuggler_id)
	end

end
