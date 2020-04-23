Rails.application.routes.draw do
  root to:  'products#index'
  resources :orders
  resources :types
  resources :carts
  resources :caps
  resources :colors
  resources :products
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
