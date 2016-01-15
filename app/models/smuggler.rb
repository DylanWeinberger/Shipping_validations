class Smuggler < ActiveRecord::Base
	has_many :vehicles, through: :missions
	has_many :missions

	has_secure_password
	validates_presence_of :password, on: :create
	# validates_presence_of :username, on: :create
	# validates_presence_of :email, on: :create
	# validates_uniqueness_of  :email
	# validates_uniqueness_of :username
	# We can uncomment these when we are further along
end
