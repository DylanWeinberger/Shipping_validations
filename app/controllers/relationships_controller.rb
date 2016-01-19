class RelationshipsController < ApplicationController
	def create
		@other_smuggler = Smuggler.find(params[:smuggler_id])
		current_smuggler.follow!(@other_smuggler)
		redirect_to (:back)
		# ajax response below
		# We would need these snippets if it was a form.
		# respond_to do |format|
  #     		format.html { redirect_to(:back) }
  #     		format.js {render :action => "follow_button" }
  # 		end
	end

	def destroy
		@other_smuggler = Smuggler.find(params[:smuggler_id])
		current_smuggler.unfollow!(@other_smuggler)
		redirect_to (:back)
		# Ajax response formating below.
		# We would need these snippets if it was a form.
		# respond_to do |format|
  #   		format.html { redirect_to(:back) }
  #   		format.js {render :action => "follow_button" }
  #   	end
  	end
end
