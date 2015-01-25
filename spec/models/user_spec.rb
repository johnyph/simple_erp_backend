require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = FactoryGirl.build(:user) }
  
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:afm) }
  it { should respond_to(:phone) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:auth_token) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:afm) }
  it { should allow_value('example@domain.com').for(:email) }
  it { should ensure_length_of(:afm).is_at_least(9) }
  it { should ensure_length_of(:afm).is_at_most(9) }
  it { should be_valid }
  it { should validate_uniqueness_of(:auth_token)}
end
