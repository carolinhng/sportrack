Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "user_sports#index"

  resources :user_sports, only: [:index, :show] do
    resources :trainings, only: [:new, :create]
  end

  resources :sports, only: [:index] do
    resources :user_sports, only: [:create]
  end

  resources :trainings, only: [:show, :index, :destroy]
  resources :training_exercices, only: [:destroy, :update]


  resources :trainings, only: [] do
    get 'training_data', on: :member
    resources :training_exercices, only: [:new, :create, :index,]
    resources :seances, only: [:create, :edit]
  end

  resources :seances, only: [:update] do
    resources :training_values, only: [:create]
  end

end
