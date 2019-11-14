Rails.application.routes.draw do
  devise_for :users
  resources :products, only: %i[index show]
  resources :line_items
  resources :shopping_carts do
    member do
      post :submit_cart
    end
  end
  resources :categories, only: :show
  namespace :admin do
    resources :products
    resources :users
    resources :shopping_carts
    resources :categories
  end
  root to: 'products#index'
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
end
