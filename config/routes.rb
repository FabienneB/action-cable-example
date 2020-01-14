Rails.application.routes.draw do
  root "welcome#about"

  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get 'users/:id', to: "users#show", as: "profile"

  # When the app is instantiated, an instance of Action Cable
  # will also be created. Action Cable will establish  
  # a WebSocket connection on localhost:3000/cable,
  # and begin listening for socket requests on that URI.
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages

end
