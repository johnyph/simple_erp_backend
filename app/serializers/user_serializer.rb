class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :access_token, :first_name, :last_name, :email, :is_admin, :afm, :phone, :created_at
  
  def access_token
    object.auth_token
  end

  has_one :organization 
end
