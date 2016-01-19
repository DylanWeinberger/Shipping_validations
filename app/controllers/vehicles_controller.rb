class VehiclesController < ApplicationController
  def index
  	@vehicles = Vehicle.all
    # setting variable to all vehicles so they can be displayed on the index.
  end

  def new
  	@vehicles = Vehicle.new
    # variable set to the new vehicle
  end

  def show
    # sets variable to corresponding vehicle show page.
    @vehicle = Vehicle.find(params[:id])
  end

  def create
      # only tycoons can create vehicles. this passes the strong params and the current tycoon id to the 
	  	@vehicle = Vehicle.new(vehicle_params)
	  	@vehicle.tycoon_id = session[:tycoon_id]
      # makes sure a tycoon is logged in before trying to save.
      if logged_in_ty?
        # if a tycoon is logged in you can create a new vehicle.
  	  	if @vehicle.save
  	  		redirect_to root_path
  	  		flash[:notice] = "Your Vehicle has been created."
  	  	else 
  	  		redirect_to root_path
  	  		flash[:notice] = "Your Vehicle was not created sucessfully."
  	  	end
      else
        redirect_to :back
        flash[:notice] = "You must be a Tycoon to create a vehicle."
      end
  end
  private

  def vehicle_params

  	params.require(:vehicle).permit(:name, :image)

  end
end
