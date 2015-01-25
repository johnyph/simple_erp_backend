class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :first_name, :last_name, :email, :is_admin, :afm, :phone, :created_at
end
