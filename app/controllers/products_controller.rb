class ProductsController < ApplicationController
  def list_products
    products = Product.all
    render json: products.as_json
  end
end
