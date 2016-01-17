class RelationshipsController < ApplicationController
	def create
		@other_smuggler = Smuggler.find(params[:smuggler_id])
		current_smuggler.follow!(@other_smuggler)
		redirect_to (:back)
	end

	def destroy
		@other_smuggler = Smuggler.find(params[:smuggler_id])
		current_smuggler.unfollow!(@other_smuggler)
		redirect_to (:back)
	end
end
