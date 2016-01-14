class CreateTycoons < ActiveRecord::Migration
  def change
    create_table :tycoons do |t|
    	t.string :username
    	t.string :email
    	t.string :password
    	t.integer :home
    	t.string :cigar
    	t.decimal :networth


      t.timestamps null: false
    end
  end
end
