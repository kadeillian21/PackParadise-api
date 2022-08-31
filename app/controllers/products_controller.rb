class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    one_product = Product.find_by(id: params["id"])
    render json: one_product.as_json
  end
end
