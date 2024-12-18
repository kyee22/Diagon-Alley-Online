Rails.application.routes.draw do
  root 'home#index'
  resources :delivery_addresses
  devise_for :users
  resources :delivery_addresses, only: [:new, :create, :edit, :update, :destroy, :index]

  get 'manage_products', to: 'products#manage'

  resources :products do
    resource :favorite, only: [] do
      post 'favorite', to: 'favorites#create', as: :favorite
      delete 'favorite', to: 'favorites#destroy', as: :unfavorite
    end
    resources :cart_items, only: [:create]
  end
  # 添加 /favorities 路由到 FavoritesController#index 动作
  get 'favorities', to: 'favorites#index', as: :favorities

  resources :cart_items, only: [:index, :destroy, :update]

  ##################### 订单相关路由
  resources :orders, only: %i[index create] do
    member do
      post :pay
      post :confirm_receive
      post :cancel
    end
  end

  namespace :admin do
    resources :attributes, only: [:index] # 创建一个属性管理入口
    resources :orders, only: %i[index] do
      member do
        post :ship
        post :cancel
      end
    end
    resources :products
  end


  resources :designs
  resources :sizes
  resources :types
  resources :colors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
