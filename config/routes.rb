Rails.application.routes.draw do

  root 'homepage#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  resources :users

  namespace :users, as: :user, path: "/:slug" do
    resources :spots, except: [:show]
  end

end
