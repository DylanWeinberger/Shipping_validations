class Vehicle < ActiveRecord::Base
	has_many :smugglers, through: :missions
	has_many :missions
	belongs_to :tycoon
	validates_uniqueness_of :name

  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
