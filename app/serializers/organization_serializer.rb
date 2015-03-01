class OrganizationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :name, :description, :afm, :email, :phone, :address, :zipcode, :city

  has_many :users
end
