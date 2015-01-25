class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :afm, :description, :in_charge, :email, :phone1, :phone2, :address, :city, :country, :zipcode
end
