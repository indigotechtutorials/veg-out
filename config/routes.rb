Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "explore_set_location", to: "explore#set_location"
  resources :profile, only: [:show], param: :user_id
  resource :settings, only: [:show, :create]
  authenticated :user do
    root to: "explore#index", as: :authenticated_user_root
  end
  # Defines the root path route ("/")
  root "home#index"
end
