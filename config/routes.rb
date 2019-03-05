Rails.application.routes.draw do
  resources :friendships
  root to: 'members#index'

  resources :members, only: [:index, :show, :new, :create]
end
