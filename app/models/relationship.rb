class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "Smuggler"
	belongs_to :followed, class_name: "Smuggler"	
end
