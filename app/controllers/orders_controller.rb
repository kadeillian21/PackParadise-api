class OrdersController < ApplicationController
  def create
    order = Order.new(
      product_id: 1,
      user_id: 1,
      quantity: 1,
      subtotal: Product.find_by(id: product_id).price * quantity,
      tax: Product.find_by(id: product_id).tax * quantity,
      total: subtotal + tax,
    )

    render json: { message: "worked" }
  end
end

# Why da heck does product.id b an undefined method???
