class ChangeDatatypeForOriginColumnInMissionTable < ActiveRecord::Migration
  def change
  	change_table :missions do |t|
  		t.change :origin, :string
  		t.change :destination, :string
  	end
  end
end
