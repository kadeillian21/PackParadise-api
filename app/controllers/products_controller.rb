class ProductsController < ApplicationController
  def list_products
    products = Product.all
    render json: products.as_json
  end

  def display_sling_fin_portal
    sling_fin_portal = Product.find_by(id: 1)
    render json: sling_fin_portal.as_json
  end

  def display_rei_magma
    rei_magma = Product.find_by(id: 2)
    render json: rei_magma.as_json
  end

  def display_therma_rest
    therma_rest = Product.find_by(id: 3)
    render json: therma_rest.as_json
  end

  def display_jetboil_minimo
    jetboil_minimo = Product.find_by(id: 4)
    render json: jetboil_minimo.as_json
  end

  def display_kuiu_trekking_poles
    kuiu_trekking_poles = Product.find_by(id: 5)
    render json: kuiu_trekking_poles.as_json
  end
end
