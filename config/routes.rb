Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :portals

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      post "portals", to: "portal_data#handle_data"
    end
  end
end
