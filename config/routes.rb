Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  resources :courses, only: %i[index]
  resources :users do
    resources :profiles, only: %i[new show create edit update destroy]
    resources :studies, only: %i[index show destroy]
  end

  resources :courses, only: %i[new show create edit update destroy] do
    resources :lessons, shallow: true do
      resources :tasks, only: %i[new create show edit update destroy], shallow: true do
        resources :matchings, only: %i[new create edit update destroy], shallow: true
      end
    end
  end
  get 'create_new_task/:bool/:id', to: 'lessons#new_task', as: :create_new_task

  resources :classrooms, only: %i[show]

  get '/my_profile', to: 'profiles#my_profile'

  # end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboards#index"
end
