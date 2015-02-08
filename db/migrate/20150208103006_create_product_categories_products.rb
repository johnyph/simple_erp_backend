class CreateProductCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :product_categories_products, id: false do |t|
      t.references :product_category, index: true
      t.references :product, index: true
    end
    add_foreign_key :product_categories_products, :product_categories
    add_foreign_key :product_categories_products, :products
  end
end
