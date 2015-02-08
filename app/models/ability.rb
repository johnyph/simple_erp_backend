class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :show, :update, :destroy, :to => :sud

    if user.is_admin?
      can :manage, :all
    else
      can :rud, user.organization
      
      #Customer
      can :index, Customer
      can :create, Customer
      can :sud, Customer.by_organization(user)

      #Supplier
      can :index, Supplier
      can :create, Supplier
      can :sud, Supplier.by_organization(user)

      #ProductCategory
      can :index, ProductCategory
      can :create, ProductCategory
      can :sud, ProductCategory

      #Product
      can :index, Product
      can :create, Product
      can :sud, Product
    end
  end
end
