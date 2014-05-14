class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :topic
      t.integer :owner_id
      t.string :home_town

      t.timestamps
    end
		add_index :groups, [:owner_id, :created_at]
  end
end
