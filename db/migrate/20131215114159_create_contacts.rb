class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contact_id
      t.integer :contactee_id

      t.timestamps
    end
    add_index :contacts, :contact_id
    add_index :contacts, :contactee_id
    add_index :contacts, [:contact_id, :contactee_id], unique: true
  end
end
