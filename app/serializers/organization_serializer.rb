class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :afm, :email, :phone, :address, :zipcode, :city

  has_many :users
end
