class RenameColumn < ActiveRecord::Migration
  def change
	rename_column :groups, :user_id, :owner
  end
end
