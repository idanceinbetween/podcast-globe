Rails.application.routes.draw do
  resources :podcasts, only: [:show, :index]
  resources :episodes, only: [:show]
  resources :users
  root to: "podcasts#index"
end
