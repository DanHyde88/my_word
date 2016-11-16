Rails.application.routes.draw do
  root to: 'queries#index'
  
  resources :users do
    resources :queries
  end

  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'


end
