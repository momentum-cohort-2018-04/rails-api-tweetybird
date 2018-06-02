Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :stories, format: "json" member do
        post :share
      end
      resources :users, format: "json"
      resource :sessions, only: :create
    end
  end




end
