class Organization < ActiveRecord::Base
	validates :name, :afm, :email, :phone, :address, :zipcode, :city, presence: true
	validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}

  has_many :users, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :suppliers, dependent: :destroy
end
