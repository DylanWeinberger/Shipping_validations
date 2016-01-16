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
		  		redirect_to login_path
		  		flash[:notice] = "Your account was created."
		  		
		  	else
		  		redirect_to :back
		  		flash[:notice] = "Something went wrong."
		  	end
  end

  def edit
    @smuggler = Smuggler.find(params[:id])

  end

  def update
    @smuggler = Smuggler.find(params[:id])
    if current_smuggler
      @smuggler.update(smuggler_params)
      redirect_to smuggler_path @smuggler
      flash[:notice] = "Smuggler Updated!"
    else
      redirect_to :back
      flash[:notice] = "Not your profile to edit."
    end
  end

  def destroy
  	@smuggler = Smuggler.find(params[:id])
    @smuggler.destroy
    session[:smuggler_id] = nil

  	
  	redirect_to root_path
  end


  private
  
  def smuggler_params

		params.require(:smuggler).permit(:username, :email, :password, :location, :home, :avatar)

  end

end
