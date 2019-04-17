Rails.application.routes.draw do
  resources :podcasts, only: [:show, :index]
  resources :episodes, only: [:show]
  resources :users
  root to: "podcasts#index"

  get "/login_form", to: "sessions#login_form"
  post "/login", to: "sessions#login", as: "login"
  delete "/logout", to: "sessions#logout"
  get "/profile", to: "users#profile"
end
