Rails.application.routes.draw do
  root to: "podcasts#index"

  # session routes
  get "/login_form", to: "sessions#login_form", as: "login_form"
  post "/login", to: "sessions#login", as: "login"
  delete "/logout", to: "sessions#logout"
  get "/profile", to: "users#profile"

  # podcasts routes
  resources :podcasts, only: [:show, :index]
  post "/podcasts/:id/subscription", to: "podcasts#subscription", as: "subscription"

  # other
  resources :episodes, only: [:show]
  resources :users

end
