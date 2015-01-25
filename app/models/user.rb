class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :afm, presence: true
  validates :afm, uniqueness: true
  validates :afm, length: {minimum: 9, maximum: 9}
  validates :auth_token, uniqueness: true
  
  belongs_to :organization

  before_save :ensure_authentication_token
 
  def ensure_authentication_token
    if auth_token.blank?
      self.auth_token = generate_authentication_token!
    end
  end
 
  
  def generate_authentication_token!
    loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).first
    end
  end

end
