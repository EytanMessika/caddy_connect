Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:edit, :update]
  resources :products, only: [:update]
     authenticated :user do
       root 'products#index', as: :authenticated_root
     end
     get "/stats", to: "products#stats"
     get "stats/graph", to: "products#graph"
     root "pages#home"
     post "/webhooks" => "webhooks#delivery_status"
end
