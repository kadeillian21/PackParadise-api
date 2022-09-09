class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders

      render template: "orders/index"
    else
      render json: { message: "You are not authorized to view this page." }, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params["id"])

    if current_user && current_user.id == @order.user_id
      render template: "orders/show"
    else
      render json: { message: "You are not authorized to view this page." }, status: :unauthorized
    end
  end

  def create
    product = Product.find_by(id: params["product_id"])
    calculated_subtotal = product.price * params["quantity"].to_i
    calculated_tax = product.tax * params["quantity"].to_i
    calculated_total = calculated_subtotal + calculated_tax
    @order = Order.new(
      product_id: params["product_id"],
      user_id: current_user.id,
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.save
      render template: "orders/show"
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
