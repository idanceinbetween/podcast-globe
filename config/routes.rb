Rails.application.routes.draw do
  resources :podcasts, only: [:show, :index]
  resources :episodes, only: [:show]
  resources :users
end
