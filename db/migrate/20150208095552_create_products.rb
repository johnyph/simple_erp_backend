class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :code
      t.references :organization, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :organizations
    add_foreign_key :products, :users
  end
end
