class Mission < ActiveRecord::Base
	belongs_to :smuggler
	belongs_to :vehicle
	validates_presence_of :cargo
	validates_presence_of :cost
end
