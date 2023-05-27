Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "events#index"

  get "/attend_events/:event_id", to: "attend_events#destroy"
  get "/attend_events/", to: "attend_events#add"
  get "/users/:id", to: "users#show"

  resources :events
end
