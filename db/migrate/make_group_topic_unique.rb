class AddAdminToUsers < ActiveRecord::Migration
  def change
    change_column :groups, :topic, unique: true
  end
end