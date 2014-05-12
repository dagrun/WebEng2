class RemoveMembersFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :members_user_id, :integer
  end
end
