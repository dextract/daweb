class CreateNews < ActiveRecord::Migration
  def change

    create_table :news do |t|
      t.string :title
      t.string :photo
      t.integer :user_id
      t.string :content
      t.timestamps
    end

    add_index :news, [:user_id,:created_at]
  end
end