class ChangeTycoonsIdColumnInVehcilesTable < ActiveRecord::Migration
  def change
  	rename_column :vehicles, :tycoons_id, :tycoon_id
  end
end
