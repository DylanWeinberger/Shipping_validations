class ChangePasswordColumnNameInSmugglersTable < ActiveRecord::Migration
  def change
  	rename_column :smugglers, :password, :password_digest
  end
end
