class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :members
      t.string :topic
      t.integer :owner
      t.string :home_town

      t.timestamps
    end
  end
end
