Rails.application.routes.draw do
  root to: 'members#index'

  resources :members, only: [:index, :show, :new, :create]
  resources :friendships, only: :create
end
