Rails.application.routes.draw do

  root 'homepage#index'

  get "/auth/:provider/callback", to: "sessions#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :gauges

  namespace :users, as: :user, path: "/:slug" do
    resources :spots
  end

  namespace :api do
    namespace :v1 do
      resources :polygons, except: [:new, :edit]
      resources :spots, except: [:new, :edit]
      post "/area_watch", to: "area_watches#create"
    end
  end

end
