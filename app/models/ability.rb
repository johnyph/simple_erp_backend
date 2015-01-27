class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :read, :update, :destroy, :to => :rud

    if user.is_admin?
      can :manage, :all
    else
      can :rud, user.organization
      
      can :create, Customer
      can :rud, Customer.by_organization(user)
    end
  end
end
