class RemoveHomeColumnFromSmugglers < ActiveRecord::Migration
  def change
  	remove_column :smugglers, :home, :integer
  end
end
