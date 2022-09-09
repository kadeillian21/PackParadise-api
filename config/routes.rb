Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #products routes
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "products/:id" => "products#destroy"

  # Supplier Route
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "suppliers/:id" => "suppliers#destroy"

  # Authentication Routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Order Routes
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
  patch "/orders/:id" => "orders#update"
  delete "orders/:id" => "orders#destroy"
end
