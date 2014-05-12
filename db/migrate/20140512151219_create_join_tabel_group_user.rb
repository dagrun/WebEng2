class CreateJoinTabelGroupUser < ActiveRecord::Migration
  def change
    create_table :join_tabel_group_users do |t|
      t.string :User
      t.string :Group
    end
  end
end
