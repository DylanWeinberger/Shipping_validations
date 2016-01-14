class Smuggler < ActiveRecord::Base
	has_many :vehicles, through: :missions
	has_many :missions
end
