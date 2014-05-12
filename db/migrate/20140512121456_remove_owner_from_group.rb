class RemoveOwnerFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :owner_user_id, :integer
  end
end
