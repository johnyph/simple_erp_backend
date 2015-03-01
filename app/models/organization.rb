class Organization < ActiveRecord::Base
	validates :name, :afm, :email, :phone, :address, :zipcode, :city, presence: true
	validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}

  has_many :users, dependent: :delete_all
  has_many :customers, dependent: :delete_all
  has_many :suppliers, dependent: :delete_all
  has_many :product_categories, dependent: :delete_all

  self.per_page = 10

  scope :filter_by_name, lambda { |keyword|
    where("lower(name) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :filter_by_afm, lambda { |keyword|
    where("lower(afm) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  def self.search(params = {}, existing=nil)
    if (existing != nil) 
      organizations = existing
    else
      organizations = Organization.all
    end
    
    organizations = organizations.filter_by_name(params[:name]) if params[:name]
    organizations = organizations.filter_by_afm(params[:afm]) if params[:afm]
    
    organizations
  end
end
