class Api::V1::SuppliersController < ApplicationController
  before_action :authenticate_with_token!
  load_and_authorize_resource
  
  respond_to :json

  def index
    respond_with Supplier.search(params, Supplier.by_organization(current_user))
  end

  def show
    respond_with Supplier.by_organization(current_user).find(params[:id])
  end

  def create
    supplier = Supplier.new(supplier_params)
    supplier.user = current_user

    if current_organization
      supplier.organization = current_organization
    else
      render json: { errors: 'Δεν είναι αναθετημένος σε οργανισμό' }, status: 422
      return false
    end
    
    if supplier.save
      render json: supplier, status: 201, location: [:api, supplier]
    else
      render json: { errors: supplier.errors }, status: 422
    end
  end

  def update
    supplier = Supplier.find(params[:id])
    
    if supplier.update(supplier_params)
      render json: supplier, status: 200, location: [:api, supplier]
    else
      render json: { errors: supplier.errors }, status: 422
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    head 204
  end

  private

  def supplier_params
    params.require(:supplier).permit(:in_charge, :sales_email, :support_email, :name, :address, :afm, :support_phone, :sales_phone, :city, :description, :country, :zipcode)
  end
end
