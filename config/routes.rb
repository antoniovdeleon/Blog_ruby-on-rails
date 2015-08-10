Rails.application.routes.draw do

  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, only: [:create]

  # sessions routes
  get "/login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  # posts routes
  resources :posts, except: [:index]

  root "posts#index"

end
