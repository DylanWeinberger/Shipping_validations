class RemoveTypeColumnFromVehiclesTable < ActiveRecord::Migration
  def change
  	remove_column :vehicles, :type, :string
  end
end
