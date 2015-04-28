Rails.application.routes.draw do

  root 'homepage#index'

  get "/auth/:provider/callback", to: "sessions#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/area_watch", to: "area_watches#create"

  resources :users
  resources :spots, only: [:index]
  resources :polygons, only: [:index]

  namespace :users, as: :user, path: "/:slug" do
    resources :spots
    resources :polygons, only: [:create]
  end

end
