class ModifyJoinTable < ActiveRecord::Migration
  def change
	add_column :group_users, :user_id, :integer
	add_column :group_users, :group_id, :integer
  end
end
