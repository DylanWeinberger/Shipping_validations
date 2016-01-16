class VehiclesController < ApplicationController
  def index
  	@vehicles = Vehicle.all
  end

  def new
  	@vehicles = Vehicle.new
  end

  def create

	  	@vehicle = Vehicle.new(vehicle_params)
	  	@vehicle.tycoon_id = session[:tycoon_id]
      if logged_in_ty?
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
  	# Would like to add a picture to vehicle attributes.

  end
end
