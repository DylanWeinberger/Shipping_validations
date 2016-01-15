class Mission < ActiveRecord::Base
	belongs_to :smuggler
	belongs_to :vehicle
	validates_presence_of :cargo
	validates_presence_of :cost

	TYPES = ["Philadelphia", "Atlantic City", "New York", "Brooklyn", "Chicago", "New Orleans"]

	def show_me_origin

		TYPES[self.origin]

	end

	def show_me_destination

		TYPES[self.destination]

	end


end
