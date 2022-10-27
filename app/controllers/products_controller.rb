class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    if params["category"]
      category = Category.find_by(name: params["category"])
      @products = category.products
    end
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      # image_url: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )

    if @product.save
      # Image.create(url: params["image_url"], product_id: @product.id)
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    # @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description

    if @product.save
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy

    render json: { message: "The product has been successfully deleted!" }
  end
end
