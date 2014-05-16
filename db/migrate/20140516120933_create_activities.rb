class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :image_url
      t.references :group, index: true

      t.timestamps
    end
  end
end
