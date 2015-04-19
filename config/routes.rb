Rails.application.routes.draw do

  root 'homepage#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users

  namespace :users, as: :user, path: "/:slug" do
    resources :spots, except: [:show]
  end

end
