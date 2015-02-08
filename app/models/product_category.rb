class ProductCategory < ActiveRecord::Base
  validates :name, :code, presence: true

  belongs_to :organization
  belongs_to :user

  has_and_belongs_to_many :products

  before_destroy {|product_category| product_category.products.clear}

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

  def self.search(params = {}, existing=nil)
    if (existing != nil) 
      product_categories = existing
    else
      product_categories = ProductCategory.all
    end
    
    product_categories = product_categories.filter_by_name(params[:name]) if params[:name]
    product_categories = product_categories.filter_by_afm(params[:afm]) if params[:afm]
    
    product_categories
  end
end
