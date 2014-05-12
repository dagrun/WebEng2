class RenameJoinTable < ActiveRecord::Migration
  def change
	rename_table :join_tabel_group_users, :group_users
  end
end
