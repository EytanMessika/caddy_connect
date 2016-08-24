Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:edit, :update]
  resources :products, only: [:update]
  authenticated :user do
   root 'products#index', as: :authenticated_root
  end
  root "pages#home"
end
