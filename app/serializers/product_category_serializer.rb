class ProductCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description
end
