Rails.application.routes.draw do

  root 'homepage#index'

  get "/auth/:provider/callback", to: "sessions#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users  do
    resources :spots
  end

  namespace :api do
    namespace :v1 do
      resources :polygons, only: [:index, :create]
      resources :spots, only: [:index, :show]
      resources :gauges, only: [:show, :create]
      resources :area_watches, only: [:create]
    end
  end

end
