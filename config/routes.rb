Rails.application.routes.draw do
  root to:  'products#index'
  resources :line_items
  resources :breweries, only: [:show, :index] 
  resources :contact, only: [:index]
  resources :about, only: [:index]
  resources :orders
  resources :caps, only: [:show, :index]
  resources :colors, only: [:show, :index]
  resources :products, only: [:show, :create, :index]
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :carts
  
  resources :webhooks, only: [:create] 

  scope '/checkout' do 
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

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
    resources :bre
  end
end
