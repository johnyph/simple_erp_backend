class Organization < ActiveRecord::Base
	validates :id, :name, :afm, :email, :phone, :address, :zipcode, :city, presence: true
	validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}

  has_many :users
end
