class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.references :groups, index: true
      t.references :users, index: true

      t.timestamps
    end
  end
end
