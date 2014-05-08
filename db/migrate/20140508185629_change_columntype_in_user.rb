class ChangeColumntypeInUser < ActiveRecord::Migration
  def change
	rename_column :users, :Group, :group_id
  end
end
