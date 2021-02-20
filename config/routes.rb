Rails.application.routes.draw do

  devise_for :users
  root to: 'youtubers#index'
  resources :ideas
  resources :youtubers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
