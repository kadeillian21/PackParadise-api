Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products", controller: "products", action: "list_products"
  get "/sling_fin_portal", controller: "products", action: "display_sling_fin_portal"
  get "/rei_magma", controller: "products", action: "display_rei_magma"
  get "/therma_rest", controller: "products", action: "display_therma_rest"
  get "/jetboil_minimo", controller: "products", action: "display_jetboil_minimo"
  get "/kuiu_trekking_poles", controller: "products", action: "display_kuiu_trekking_poles"
end
