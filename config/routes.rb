Rails.application.routes.draw do
  resources :friendships
  root to: 'members#new'
  resources :members, only: [:index, :new, :create]
end
