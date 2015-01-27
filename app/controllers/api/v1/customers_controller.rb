class Api::V1::CustomersController < ApplicationController
	before_action :authenticate_with_token!
  load_and_authorize_resource
  
	respond_to :json

	def index
		params[:organization_id] = current_user.organization_id

		respond_with Customer.search(params, Customer.by_organization(current_user))
	end

	def show
		respond_with Customer.by_organization(current_user).find(params[:id])
	end

  def create
    customer = Customer.new(customer_params)
    customer.user = current_user

    if current_organization
      customer.organization = current_organization
    else
      render json: { errors: 'Δεν είναι αναθετημένος σε οργανισμό' }, status: 422
    end
    
    if customer.save
      render json: customer, status: 201, location: [:api, customer]
    else
      render json: { errors: customer.errors }, status: 422
    end
  end

  def update
    customer = Customer.find(params[:id])
    
    if customer.update(customer_params)
      render json: customer, status: 200, location: [:api, customer]
    else
      render json: { errors: customer.errors }, status: 422
    end
  end

  def delete
    customer = Customer.find(params[:id])
    customer.destroy
    head 204
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :address, :afm, :phone1, :phone2, :city, :description, :country, :zipcode)
  end
end
