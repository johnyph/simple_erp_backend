class Customer < ActiveRecord::Base
	validates :id, :name, :description, :in_charge, :email, :phone1, presence: true

	scope :by_organization, lambda { |user|
    where(:organization_id => user.organization_id) unless user.is_admin?
  }

  scope :filter_by_name, lambda { |keyword|
    where("lower(name) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :filter_by_afm, lambda { |keyword|
    where("lower(afm) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  def self.search(params = {}, existing=nil)
  	if (existing != nil) 
  		customers = existing
  	else
  		customers = Customer.all
  	end
  	
  	customers = customers.filter_by_name(params[:name]) if params[:name]
  	customers = customers.filter_by_afm(params[:afm]) if params[:afm]
  	customers
  end
end
