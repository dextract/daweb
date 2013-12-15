class AddExCollaboratorToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :ex, :boolean, default: false
  end
end
