class ChangePasswordColumnNameInTycoonsTable < ActiveRecord::Migration
  def change
  	rename_column :tycoons, :password, :password_digest
  end
end
