Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :projects do
    resources :participations, only: %i[create destroy]
    resources :rooms, only: %i[show new create update destroy]

  end
  resources :rooms, only: [] do
    resources :tasks, only: %i[create update destroy]
  end
  get "dashboard", to: "dashboards#mydashboard", as: "dashboard"
  delete "rooms/:id", to: "rooms#destroy", as: "destroy_room"
end
