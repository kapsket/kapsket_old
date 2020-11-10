Rails.application.routes.draw do
  root to:  'products#index'
  resources :line_items
  resources :breweries, only: [:show, :index] 
  resources :contact, only: [:index]
  resources :about, only: [:index]
  resources :orders
  resources :caps, only: [:show, :index]
  resources :colors, only: [:show, :index]
  resources :products, only: [:show, :index]
  devise_for :users 
  resources :carts 


  namespace :admin do 
    root to: 'products#index'
    resources :orders 
    resources :types
    resources :caps  do
      resources :images, only: [:create]
      end
    resources :colors 
    resources :products do
      resources :photos, only: [:create]
      end
    resources :users do 
      resources :carts 
    end
    resources :types 
    resources :breweries  
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
