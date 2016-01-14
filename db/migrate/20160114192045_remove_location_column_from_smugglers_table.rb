class RemoveLocationColumnFromSmugglersTable < ActiveRecord::Migration
  def change

  end

    def self.down
    remove_column :smugglers, :location
  end

end
