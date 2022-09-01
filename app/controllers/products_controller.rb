class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    one_product = Product.find_by(id: params["id"])
    render json: one_product.as_json
  end

  def create
    product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    render json: product.as_json
  end
end
