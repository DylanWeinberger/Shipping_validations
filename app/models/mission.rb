class Mission < ActiveRecord::Base
	belongs_to :user
	belongs_to :vehicle
end
