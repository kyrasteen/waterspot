Rails.application.routes.draw do

  root 'homepage#index'

  get "/auth/:provider/callback", to: "sessions#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :spots, only: [:index]
  resources :polygons, only: [:index]

  namespace :users, as: :user, path: "/:slug" do
    resources :spots, except: [:show]
    resources :polygons, only: [:create]
  end

end
