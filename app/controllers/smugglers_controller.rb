class SmugglersController < ApplicationController
 
  def index
  		@smugglers = Smuggler.all
      @tycoons = Tycoon.all
      # Sets the Tycoons and the smugglers to be viewed on the smuggler index page.
  end

  def show
      # Finds the smuggler page and makes sure to display the information of the corresponding smuggler.
  		@smuggler = Smuggler.find(params[:id])
      current_smuggler = @current_smuggler
  end

  def new
  		@smuggler = Smuggler.new
  end

  def create
      # passes the strong smuggler params through a new smuggler.
	  	@smuggler = Smuggler.new(smuggler_params)
		  	if @smuggler.save
		  		redirect_to login_path
		  		flash[:notice] = "Your account was created."
          # if smuggler is saved it will redirect to the login and alert that it was created.
		  	else
		  		redirect_to :back
		  		flash[:notice] = "Something went wrong."
          # If not the user is alerted and redirected back.
		  	end
  end

  def edit
    @smuggler = Smuggler.find(params[:id])
    # Sets the smuggler variable to the correct smuggler for the page.
  end

  def update
    @smuggler = Smuggler.find(params[:id])
    if logged_in_ty?
        @smuggler.update(smuggler_params)
        # updates smuggler with strong params.
        redirect_to smuggler_path @smuggler
        # rredirects to the smuggler's show page. and alert them.
        flash[:notice] = "Smuggler Updated!"
    elsif logged_in?
      # If there is a current smuggler continue
      if current_smuggler.id == @smuggler.id
        # If the currentSmugglers id matches the smuggler for this page continue 
          @smuggler.update(smuggler_params)
          # updates smuggler with strong params.
          redirect_to smuggler_path @smuggler
          # rredirects to the smuggler's show page. and alert them.
      else
          # if current_smugglers id does not match redirects back and alerts user.
          redirect_to :back
          flash[:notice] = "Not your account to update."  
        end
    else
      # if not logged in
      redirect_to :back
      flash[:notice] = "You do not have permission to update."
    end
  end

  def destroy
    # This action has very similar logic to the update function. Checks if there is a logged in tycoon or if logged in
    # smuggler has a matching id. If either of those account is deleted and smuggler logged out. Else redirect back.
    @smuggler = Smuggler.find(params[:id])
    if logged_in_ty? 
      @smuggler.destroy
      redirect_to smugglers_path
      flash[:notice] = "Account Deleted."
    elsif logged_in?
        if @current_smuggler.id == @smuggler.id
          	@smuggler.destroy
            session[:smuggler_id] = nil
            redirect_to smugglers_path
            flash[:notice] = "Account Deleted."
        else
            redirect_to :back
            flash[:notice] = "Not your account to delete."  
        end
    else
      redirect_to :back
      flash[:notice] = "You do not have permission to delete this account."  
    end
  end

layout "smug"
# All actions and views related to smugglers use the smug layout.
  private
  
  def smuggler_params

		params.require(:smuggler).permit(:username, :email, :password, :location, :home, :avatar)

  end

end
