Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "user_sports#index"

  resources :user_sports, only: [:index, :new, :create, :show] do
    resources :trainings, only: [:new, :create] do
      resources :training_exercices, only: [:new, :create]
      resources :seances, only: [:create, :edit] do
        resources :training_values, only: [:create]
      end
    end
  end

  resources :trainings, only: [:show]
end
