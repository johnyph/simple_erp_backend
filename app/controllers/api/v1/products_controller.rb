class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_with_token!
  load_and_authorize_resource
  
  respond_to :json

  def index
    respond_with Product.search(params, Product.by_organization(current_user))
  end

  def show
    respond_with Product.by_organization(current_user).includes(:product_categories, :product_suppliers).find(params[:id])
  end

  def create
    product = Product.new(product_params)

    product.user = current_user
    if current_organization
      product.organization = current_organization
    else
      render json: { errors: 'Δεν είναι αναθετημένος σε οργανισμό' }, status: 422
      return false
    end


    if product.save
      render json: product, status: 201, location: [:api, product]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = Product.find(params[:id])
    
    if product.update(product_params)
      render json: product, status: 200, location: [:api, product]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    head 204
  end

  def product_params
    params.require(:product).permit(:name, :code, :description, product_category_ids: [])
  end
end
