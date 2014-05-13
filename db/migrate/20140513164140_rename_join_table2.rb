class RenameJoinTable2 < ActiveRecord::Migration
  def change
	rename_table :group_users, :groups_users
  end
end
