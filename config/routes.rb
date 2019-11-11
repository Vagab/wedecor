Rails.application.routes.draw do
  devise_for :users
  resources :products, only: %i[index show]
  resources :line_items
  resources :shopping_carts
  namespace :admin do
    resources :products
    resources :users
    resources :shopping_carts
  end
  root to: 'products#index'
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
end
