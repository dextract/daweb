class AddOwnerToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :owner_id, :integer
  end
end
