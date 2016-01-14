class RemoveColumnHomeAndLocationFromTycoonsTable < ActiveRecord::Migration
  def change
  	remove_column :tycoons, :home, :integer
  	remove_column :tycoons, :location, :integer
  end
end
