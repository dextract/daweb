class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.string :description
      t.string :picture
      t.string :encrypted_password
      t.string :salt
      t.timestamps
    end
  end
end
