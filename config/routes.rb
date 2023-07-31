Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", sessions: "users/sessions" }
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
