class SmugglersController < ApplicationController
 
  def index
  		@smugglers = Smuggler.all
      @tycoons = Tycoon.all
  end

  def show
  		@smuggler = Smuggler.find(params[:id])
      current_smuggler = @current_smuggler
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
      if current_smuggler.id == @smuggler.id
          @smuggler.update(smuggler_params)
          redirect_to smuggler_path @smuggler
          flash[:notice] = "Smuggler Updated!"
        elsif session[:tycoon_id]
          @smuggler.update(smuggler_params)
          redirect_to smuggler_path @smuggler
          flash[:notice] = "Smuggler Updated!"
        else
          redirect_to :back
          flash[:notice] = "Not your account to update."  
        end
    else
      redirect_to :back
      flash[:notice] = "Please sign in."
    end
  end

  def destroy
    @smuggler = Smuggler.find(params[:id])
    if current_smuggler
      if current_smuggler.id == Smuggler.find(params[:id])
    	    @smuggler.destroy
          session[:smuggler_id] = nil
          redirect_to smugglers_path
          flash[:notice] = "Account Deleted."
      elsif session[:tycoon_id]
        @smuggler.destroy
        redirect_to smugglers_path
        flash[:notice] = "Account Deleted."
      else
        redirect_to :back
        flash[:notice] = "Not your account to delete."  
      end
    else
      redirect_to :back
      flash[:notice] = "Please sign in."
    end
  end

layout "smug"
  private
  
  def smuggler_params

		params.require(:smuggler).permit(:username, :email, :password, :location, :home, :avatar)

  end

end
