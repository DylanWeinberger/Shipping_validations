class Tycoon < ActiveRecord::Base
	has_many :vehicles
	has_secure_password
	# validates_presence_of :password, on: :create


	# paperclip below
  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
