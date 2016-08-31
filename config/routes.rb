Rails.application.routes.draw do

  get 'payments/new'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:edit, :update]
  resources :payments, only: [:create]
  resources :products, only: [:update]
  resources :bookings, only: [:create]
  resources :activities, only: [:update]
  authenticated :user do
   root 'products#index', as: :authenticated_root
  end
  get "/stats", to: "products#stats"
  get "/premium", to: "payments#premium", as: :premium
  root "pages#home"
  post "/webhooks" => "webhooks#delivery_status"
end
