class Tycoon < ActiveRecord::Base
	has_many :vehicles
	has_secure_password


	# paperclip below
  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
