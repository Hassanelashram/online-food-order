Rails.application.routes.draw do
  root to: 'pages#home'
  resources :orders
  resources :dishes do
    resources :order_items, only: :create
  end
  resources :order_items, only: [:index, :destroy, :update]
end
