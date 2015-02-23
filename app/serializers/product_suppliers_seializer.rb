class ProductSerializer < ActiveModel::Serializer
  
  attributes :id, :sell, :cost, :vat, :default
  
  
end
