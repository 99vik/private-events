Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "events#index"

  get "/users/:id", to: "users#show"

  resources :events
end
