class Api::V1::ProductCategoriesController < ApplicationController
  before_action :authenticate_with_token!
  load_and_authorize_resource
  
  respond_to :json

  def index
    respond_with ProductCategory.search(params, ProductCategory.by_organization(current_user))
  end

  def show
    respond_with ProductCategory.by_organization(current_user).find(params[:id])
  end

  def create
    product_category = ProductCategory.new(product_category_params)

    product_category.user = current_user
    if current_organization
      product_category.organization = current_organization
    else
      render json: { errors: 'Δεν είναι αναθετημένος σε οργανισμό' }, status: 422
      return false
    end

    if product_category.save
      render json: product_category, status: 201, location: [:api, product_category]
    else
      render json: { errors: product_category.errors }, status: 422
    end
  end

  def update
    product_category = ProductCategory.find(params[:id])
    
    if product_category.update(product_category_params)
      render json: product_category, status: 200, location: [:api, product_category]
    else
      render json: { errors: product_category.errors }, status: 422
    end
  end

  def destroy
    product_category = ProductCategory.find(params[:id])
    product_category.destroy
    head 204
  end

  private

  def product_category_params
    params.require(:product_category).permit(:name, :code, :description)
  end
end
