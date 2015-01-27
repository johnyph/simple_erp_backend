class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.string :code
      t.string :description
      t.references :organization, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_categories, :organizations
    add_foreign_key :product_categories, :users
  end
end
