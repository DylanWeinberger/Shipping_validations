class Mission < ActiveRecord::Base
	belongs_to :smuggler
	belongs_to :vehicle
	validates_presence_of :cargo
	validates_presence_of :cost

	TYPES = ["Philadelphia", "Atlantic City", "New York", "Brooklyn", "Chicago", "New Orleans"]

	def show_me_origin

		TYPES[self.conditon]

	end

	def show_me_desitination

		TYPES[self.condition]

	end

end
