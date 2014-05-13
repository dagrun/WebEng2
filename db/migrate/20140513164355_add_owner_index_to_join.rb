class AddOwnerIndexToJoin < ActiveRecord::Migration
  def change
	add_column :groups_users, :owner, :boolean
	add_index :groups_users, :owner
  end
end
