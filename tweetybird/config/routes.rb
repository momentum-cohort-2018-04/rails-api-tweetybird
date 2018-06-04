Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :stories, format: "json" do
        member do
          get :follower_stories
          post :share
        end
      end
      resources :users, format: "json" do 
        member do
          get :follow
          get :follows
          delete :unfollow
        end
      end
      resource :sessions, only: :create
    end
  end
end
