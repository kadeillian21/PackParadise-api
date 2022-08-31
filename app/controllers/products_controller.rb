class ProductsController < ApplicationController
  def list_products
    products = Product.all
    render json: products.as_json
  end

  def one_product
    one_product = Product.find_by(id: params["id"])
    render json: one_product.as_json
  end
end
