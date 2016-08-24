Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:edit, :update]
  authenticated :user do
    root 'products#index', as: :authenticated_root
  end
  resources :products
  root 'pages#home'

end
