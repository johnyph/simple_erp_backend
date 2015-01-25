class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :afm, presence: true
  validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}
  validates :auth_token, uniqueness: true
  
end
