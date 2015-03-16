class Api::V1::OrganizationsController < ApplicationController
	before_action :authenticate_with_token!
	load_and_authorize_resource
	
	respond_to :json

	def index
		organizations = Organization.search(params).order("#{params['sort']} #{params['direction'].upcase}").paginate(page: params[:page])
		render json: organizations,
		 meta: {total_pages: organizations.total_pages}, status: 200
	end

	def show
		respond_with Organization.find(params[:id])
	end

	def create
		organization = Organization.new(organization_params)

		if organization.save
			render json: organization, status: 201, location: [:api, organization]
		else
			render json: { errors: organization.errors }, status: 422
		end
	end

	def update
		organization = Organization.find(params[:id])

		if organization.update(organization_params)
			render json: organization, status: 200, location: [:api, organization]
		else
			render json: { errors: organization.errors }, status: 422
		end
	end

	def destroy
		organization = Organization.find(params[:id])
		organization.destroy
		head 204
	end

	private

	def organization_params
    params.require(:organization).permit(:email, :name, :address, :afm, :phone, :city, :description, :zipcode)
  end
end
