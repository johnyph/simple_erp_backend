class Api::V1::CustomersController < ApplicationController
	before_action :authenticate_with_token!
	respond_to :json

	def index
		params[:organization_id] = current_user.organization_id

		respond_with Customer.search(params, Customer.by_organization(current_user))
	end

	def show
		respond_with Customer.by_organization(current_user).find(params[:id])
	end
end
