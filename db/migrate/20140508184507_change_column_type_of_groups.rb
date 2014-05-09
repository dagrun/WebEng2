class ChangeColumnTypeOfGroups < ActiveRecord::Migration
  def change
	rename_column :group, :members, :members_user_id
	rename_column :group, :owner, :owner_user_id
  end
end
