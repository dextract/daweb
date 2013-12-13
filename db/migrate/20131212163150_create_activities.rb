class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :blurb
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
