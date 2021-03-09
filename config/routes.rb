Rails.application.routes.draw do

  namespace :admin do
    resources :youtubers
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'youtubers#index'

  resources :youtubers
  resource :user, only: [:show]
  resources :ideas do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
