class AddTycoonRefrencesToMissionsTable < ActiveRecord::Migration
  def change
  	add_reference :missions, :tycoon, index: true
  end
end
