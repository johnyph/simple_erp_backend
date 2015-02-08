class ProductSupplier < ActiveRecord::Base
  belongs_to :product
  belongs_to :supplier
  belongs_to :organization
  belongs_to :user

  validates_numericality_of :price, :sell, :vat
end
