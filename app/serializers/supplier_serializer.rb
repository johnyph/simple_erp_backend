class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :afm, :description, :in_charge, :support_email, :sales_email, :support_phone, :sales_phone, :address, :city, :country, :zipcode
end
