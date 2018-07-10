Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :stories, format: "json" do
        member do
          post :share
        end
      end
      resources :users, format: "json"
      resource :sessions, only: :create
    end
  end
  resource :docs, only: :index
  root 'docs#index'
end
