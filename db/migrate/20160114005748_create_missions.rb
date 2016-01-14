class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
    	t.references :smuggler
    	t.references :vehicle
    	t.decimal :cost
    	t.text :cargo
    	t.integer :origin
    	t.integer :destination
    	t.string :name
    	t.integer :containers

      t.timestamps null: false
    end
  end
end
