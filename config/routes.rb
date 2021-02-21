Rails.application.routes.draw do

  devise_for :users
  root to: 'youtubers#index'

  resources :youtubers
  resources :ideas do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
