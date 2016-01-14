class SmugglersController < ApplicationController
 
  def index
  		@smugglers = Smuggler.all
  end

  def show
  		@smuggler = Smuggler.find(params[:id])
  end

  def new
  		@smuggler = Smuggler.new
  end

  def create
	  	@smuggler = Smuggler.new(smuggler_params)
		  	if @smuggler.save
		  		redirect_to smugglers_path
		  		flash[:notice] = "Your account was created."
		  		create_smuggler_session
		  	else
		  		redirect_to :back
		  		flash[:notice] = "Something went wrong."
		  	end
  end

  def edit
    

  end

  def update

  end

  def destroy
  	@smuggler = Smuggler.find(params[:id])
    @smuggler.destroy
    session[:smuggler_id] = nil

  	
  	redirect_to root_path
  end

  private
  
  def smuggler_params

		params.require(:smuggler).permit(:username, :email, :password, :location, :home)

  end

end
