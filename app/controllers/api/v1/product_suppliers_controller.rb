class Api::V1::ProductSuppliersController < ApplicationController
  def create

  end

  def product_suppliers_params
    params.require(:product_suppliers).permit(:supplier_id, :product_id, :cost, :sell, :vat, :default)
  end
end
