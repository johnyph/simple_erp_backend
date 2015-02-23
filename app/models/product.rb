class Product < ActiveRecord::Base
  validates :name, :code, presence: true
  validate :minimum_one_category
  
  belongs_to :organization
  belongs_to :user
  has_many :product_suppliers
  #has_many :suppliers, through: :product_suppliers
  has_and_belongs_to_many :product_categories

  before_destroy {|product| product.product_categories.clear}
  before_destroy {|product| product.product_suppliers.clear}

  #has_many products destroy does not delete products

  scope :by_organization, lambda { |user|
    where(:organization_id => user.organization_id) unless user.is_admin?
  }

  scope :filter_by_name, lambda { |keyword|
    where("lower(name) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :filter_by_code, lambda { |keyword|
    where("lower(code) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :find_by_supplier, lambda { |keyword|
    joins(:product_suppliers).
    where("lower(product_suppliers.supplier_id) = ?", "%#{keyword.downcase}%" ) 
  }

  def self.search(params = {}, existing=nil)
    if (existing != nil) 
      products = existing
    else
      products = Product.all
    end
    
    products = product_categories.filter_by_name(params[:name]) if params[:name]
    products = product_categories.filter_by_afm(params[:afm]) if params[:afm]
    products = product_categories.filter_by_supplier(params[:supplier]) if params[:supplier]
    products
  end


  private

  def minimum_one_category
    if self.product_categories.length < 1
      errors.add(:product_categories, 'Το προιόν πρέπει να ανήκει σε τουλάχιστον μία κατηγορία')
      return false
    end
  end
end
