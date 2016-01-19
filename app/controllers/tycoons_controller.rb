class TycoonsController < ApplicationController
	# Currently Tycoons must be created through the rails console. This is for security reasons since Tycoons have a lot of CRUD power.
	 
	def index
		@tycoons = Tycoon.all
		# make the variable equal to all tycoons to display on index.
	end

	def show
		@tycoon = Tycoon.find(params[:id])
		# make variable equal to the corresponding tycoon's page.
	end

	def new
		@tycoon = Tycoon.new
		# variable for creating a new tycoon
	end

	def create
		# passing a new tycoon the tycoon strong params.
		@tycoon = Tycoon.new(tycoon_params)
		if @tycoon.save
			redirect_to :back
			flash[:notice] = "New Tycoon Created!"
		else
			redirect_to :back
			flash[:notice] = "We could not create your Tycoon. Please try again."
		end
	end

	def edit
    @tycoon = Tycoon.find(params[:id])

  	end

  def update
    @tycoon = Tycoon.find(params[:id])
    if logged_in_ty?
      @tycoon.update(tycoon_params)
      redirect_to tycoon_path @tycoon
      flash[:notice] = "Tycoon Updated!"
    else
      redirect_to :back
      flash[:notice] = "Not your profile to edit."
    end
  end

	def destroy 
			@tycoon = Tycoon.find(params[:id])
			@tycoon.destroy
			redirect_to :back
			flash[:notice] = "Your FatCat was destroyed..."
	end

	private


	def tycoon_params

		params.require(:tycoon).permit(:username, :email, :password, :home, :cigar, :networth, :avatar)
	end
end
