class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :afm
      t.string :email
      t.string :phone
      t.string :address
      t.string :zipcode
      t.string :city

      t.timestamps null: false
    end
  end
end
