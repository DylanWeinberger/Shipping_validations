class AddAttachmentAvatarToTycoons < ActiveRecord::Migration
  def self.up
    change_table :tycoons do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :tycoons, :avatar
  end
end
