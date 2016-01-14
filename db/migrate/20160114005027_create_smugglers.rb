class CreateSmugglers < ActiveRecord::Migration
  def change
    create_table :smugglers do |t|
    	t.string :username
    	t.string :email
    	t.string :password
    	t.integer :location
    	t.integer :home

      t.timestamps null: false
    end
  end
end
