class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.string :afm
      t.string :support_email
      t.string :sales_email
      t.string :support_phone
      t.string :sales_phone
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :in_charge
      t.references :user, index: true
      t.references :organization, index: true

      t.timestamps null: false
    end
    add_foreign_key :suppliers, :users
    add_foreign_key :suppliers, :organizations
  end
end
