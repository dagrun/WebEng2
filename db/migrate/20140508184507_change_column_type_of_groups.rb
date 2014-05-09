class ChangeColumnTypeOfGroups < ActiveRecord::Migration
  def change
	rename_column :groups, :members, :members_user_id
	rename_column :groups, :owner, :owner_user_id
  end
end
