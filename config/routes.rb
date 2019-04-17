Rails.application.routes.draw do
  root to: "podcasts#index"

  # session routes
  get "/login_form", to: "sessions#login_form", as: "login_form"
  post "/login", to: "sessions#login", as: "login"
  delete "/logout", to: "sessions#logout", as: "logout"
  get "/profile", to: "users#profile", as: "profile"
  get "/profile/followships", to: "users#followshipslist", as: "followshipslist"

  # podcasts routes
  resources :podcasts, only: [:show, :index]
  post "/podcasts/:id/subscription", to: "podcasts#subscription", as: "subscription"

  #episode routes
  resources :episodes, only: [:show]
  post "/episodes/:id/favouritisation", to: "episodes#favouritisation", as: "favouritisation"

  # user routes
  resources :users
  post "/users/:id/followship", to: "users#followship", as: "followship"

  #keyword routes
  resources :keywords, only: [:show]

end
