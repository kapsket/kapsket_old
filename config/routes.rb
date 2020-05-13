Rails.application.routes.draw do
  root to:  'products#index'
  resources :breweries, only: [:show, :index] 
  resources :contact, only: [:index]
  resources :about, only: [:index]
  resources :carts 
  resources :caps, only: [:show, :index] do
      resources :images, only: [:create]
    end
  resources :colors, only: [:show, :index]
  resources :products, only: [:show, :index] do
    resources :photos, only: [:create]
    end
  devise_for :users
  resources :users

  # namespace :admin do 
  #   root to: 'admin/products#index'
  #   resources :orders, :types, :carts, :caps, :colors, :products, :users, :images, :photos  
  #   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
