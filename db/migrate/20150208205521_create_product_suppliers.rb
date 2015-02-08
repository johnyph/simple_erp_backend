class CreateProductSuppliers < ActiveRecord::Migration
  def change
    create_table :product_suppliers do |t|
      t.references :product, index: true
      t.references :supplier, index: true
      t.references :organization, index: true
      t.references :user, index: true
      t.integer :stock
      t.boolean :default
      t.decimal :cost
      t.decimal :sell
      t.decimal :vat

      t.timestamps null: false
    end
    add_foreign_key :product_suppliers, :products
    add_foreign_key :product_suppliers, :suppliers
    add_foreign_key :product_suppliers, :organizations
    add_foreign_key :product_suppliers, :users
  end
end
