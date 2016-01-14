class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.string :name
    	t.references :tycoons

      t.timestamps null: false
    end
  end
end
