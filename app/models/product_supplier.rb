class ProductSupplier < ActiveRecord::Base
  belongs_to :product
  belongs_to :supplier
  belongs_to :organization
  belongs_to :user

  validates_numericality_of :stock, :cost, :sell, :vat
  validates :product_id, :supplier_id, presence: true

  scope :by_organization, lambda { |user|
    where(:organization_id => user.organization_id) unless user.is_admin?
  }
  
end
