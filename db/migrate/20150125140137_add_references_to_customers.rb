class AddReferencesToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :user, index: true
    add_foreign_key :customers, :users
    add_reference :customers, :organization, index: true
    add_foreign_key :customers, :organizations
  end
end
