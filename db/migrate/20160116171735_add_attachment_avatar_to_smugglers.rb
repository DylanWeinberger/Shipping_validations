class AddAttachmentAvatarToSmugglers < ActiveRecord::Migration
  def self.up
    change_table :smugglers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :smugglers, :avatar
  end
end
