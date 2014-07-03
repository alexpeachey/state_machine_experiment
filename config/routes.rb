Rails.application.routes.draw do

  root to: 'posts#index'

  get 'validate/:validation_token', to: 'users#validate', as: :validate
  resources :users, only: [:index, :new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:index, :create]
  resource :session, only: [:create, :destroy]

end
