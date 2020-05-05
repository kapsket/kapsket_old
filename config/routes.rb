Rails.application.routes.draw do
  root to:  'products#index'
  resources :orders
  resources :types
  resources :carts
  resources :caps do
      resources :images, only: [:create]
    end
  resources :colors
  resources :products do
    resources :photos, only: [:create]
    end
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
