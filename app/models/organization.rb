class Organization < ActiveRecord::Base
	validates :name, :afm, :email, :phone, :address, :zipcode, :city, presence: true
	validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}

  has_many :users, dependent: :delete_all
  has_many :customers, dependent: :delete_all
  has_many :suppliers, dependent: :delete_all
end
