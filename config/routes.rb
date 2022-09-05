Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: "pages#home"

  resources :projects do
    resources :participations, only: %i[create destroy]
    resources :rooms, only: %i[show new create update destroy]
    resources :tasks
  end
  resources :rooms, only: [] do
    resources :tasks, only: %i[create update destroy] do
      member do
        patch :move
      end
    end
  end

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  patch "tasks/:id/move", to: "tasks#move", as: "move"
  get "dashboard", to: "dashboards#mydashboard", as: "dashboard"
  get "/projects/:project_id/rooms/:id/edit", to: "rooms#edit", as: "edit_room"
  get "rooms/:room_id/delete_photo/:photo", to: "rooms#delete_photo", as: "delete_photo"
  post "/chatrooms", to: "chatrooms#create", as: "create_chatroom"
end
