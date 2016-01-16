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


	#Paperclip below 
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
