class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.text :description
      t.string :in_charge
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :afm
      t.text :address
      t.string :city
      t.string :country
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
