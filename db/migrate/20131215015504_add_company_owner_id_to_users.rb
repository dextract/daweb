class AddCompanyOwnerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner_company, :integer
  end
end
