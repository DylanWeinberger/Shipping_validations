class Vehicle < ActiveRecord::Base
	has_many :smugglers, through: :missions
	has_many :missions
	belongs_to :tycoon
end
