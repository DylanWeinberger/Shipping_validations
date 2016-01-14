class DropColumnLocationFromSmugglers < ActiveRecord::Migration
  def change
  	remove_column :smugglers, :location, :integer
  end


end
