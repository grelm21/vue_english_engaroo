Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  resources :courses, only: %i[index]
  resources :users do
    resources :profiles, only: %i[new show create edit update destroy]
    resources :courses, only: %i[new show create edit update destroy] do
      resources :lessons, shallow: true
    end
  end

  get '/my_profile', to: 'profiles#my_profile'
  get '/my_materials', to: 'courses#my_materials'

  # end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboards#index"
end
