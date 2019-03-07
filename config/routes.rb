Rails.application.routes.draw do
  root to: 'members#index'

  resources :members, only: [:index, :show, :new, :create] do
    get 'search'
  end

  resources :friendships, only: :create
end
