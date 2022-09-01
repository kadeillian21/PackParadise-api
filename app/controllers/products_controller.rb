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

  def update
    product = Product.find_by(id: params["id"])

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description

    product.save
    render json: product.as_json
  end
end
