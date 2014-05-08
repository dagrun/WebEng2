class UserProperties < ActiveRecord::Migration
  def change
	add_column :User, :Group, :string
  end
end
