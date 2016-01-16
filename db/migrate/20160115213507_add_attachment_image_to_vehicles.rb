class AddAttachmentImageToVehicles < ActiveRecord::Migration
  def self.up
    change_table :vehicles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vehicles, :image
  end
end
