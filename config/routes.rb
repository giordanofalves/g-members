Rails.application.routes.draw do
  root to: 'members#new'
  resources :members, only: [:index, :new, :create]
end
