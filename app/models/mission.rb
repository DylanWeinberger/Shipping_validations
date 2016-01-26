class Mission < ActiveRecord::Base
	belongs_to :smuggler
	belongs_to :vehicle
	validates_presence_of :cargo
	validates :cargo, length: {minimum: 50}
	validates_presence_of :cost
	validates_uniqueness_of :name
	validates :cost, numericality: {greater_than: 999} 
end
