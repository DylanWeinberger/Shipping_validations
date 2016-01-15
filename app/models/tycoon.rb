class Tycoon < ActiveRecord::Base
	has_many :vehicles
	has_secure_password
	# validates_presence_of :password, on: :create

end
