class AddPendingToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :pending, :boolean, default: false
  end
end
