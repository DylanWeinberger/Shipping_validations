class MissionsController < ApplicationController
	
	def index
		@missions = Mission.all
		# This will set the variable to all missions
	end

	def new
		@mission = Mission.new
		@vehicles = Vehicle.all
		@smugglers = Smuggler.all
		# Sets the mission variable to a new mission. The vehicle and smuggler are defined as they are used in an option dropdown.
	end

	def create
		@mission = Mission.new(mission_params)
		# passes the mission params defined below onto a new instance of Mission
		if logged_in_ty?
			# If a tycoon is logged in continue.
			if @mission.origin != @mission.destination
				# if the missions origin does not equal the destination continue.
				if @mission.save
					# If all the other validations are passed the mission will save and you will be redirected to the mission show page..
					flash[:notice] = "Your mission was saved"
					redirect_to mission_path(@mission.id)
				else
					flash[:notice] = "Your mission was not saved"
					redirect_to :back
					# If not saved it will be redirected back.
				end
			else
				# if origin and destination are the same it will redirect back and flash a notice.
				flash[:notice] = "Your mission was not saved"
				redirect_to :back
			end
		else
			# If user is not a tycoon it will redirect back.
			redirect_to :back
			flash[:notice] = "Must be logged in as a Tycoon to create a Mission!"
		end	
	end

	def show
		# mission variable is equal to the mission for the current show page.
		@mission = Mission.find(params[:id])
		@smuggler_id = @mission.smuggler_id
	end

	def edit
		@mission = Mission.find(params[:id])
		# makes the variable equal to the id equal to the current id page. Same for the update action.
	end

	def update
		@mission = Mission.find(params[:id])
	end

	def destroy
		# making sure that the user is a tycoon and they can cancel the mission.
		if logged_in_ty?
			@mission = Mission.find(params[:id])
			@mission.destroy
			redirect_to missions_path
			# redirect to the missions index.
		else
			redirect_to :back
			flash[:notice] = "You must be a Tycoon to cancel a mission."
			# if not logged in as tycoon it alerts the user and does not cancel and redirects back.
		end
	end

	layout 'mission'
	# use the mission layout for all actions and views related to mission.
	private

	def mission_params
		# defining strong params to pass through.
	params.require(:mission).permit(:cost, :cargo, :origin, :destination, :name, :vehicle_id, :smuggler_id)
	end

end
