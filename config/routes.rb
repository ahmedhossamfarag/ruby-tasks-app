Rails.application.routes.draw do
  get "users/create"
  post "users/create", to: "users#create_post"
  get "users/login"
  post "users/login", to: "users#login_post"
  get "users/logout"
  get "task_notes/index"
  get "task_notes/create"
  post "task_notes/create", to: "task_notes#create_post"
  get "task_notes/edit"
  patch "task_notes/edit", to: "task_notes#edit_patch"
  get "task_notes/delete"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
