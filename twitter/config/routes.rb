Rails.application.routes.draw do
  
  namespace api do
    namespace v1 do
      resources :user do
        resources :story
      end
      resources :session
    end
  end

end
