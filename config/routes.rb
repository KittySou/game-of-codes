Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pages, only: [:home]
  get "/home", to: "pages#home", as: "home"

  resources :decks, only: [:index, :show]
  get "/levels", to: "decks#levels", as: "levels"
  get "/show", to: "decks#show", as: "show"
  get "/menu", to: "decks#menu", as: "menu"
  get "/stopwatch", to: "decks#stopwatch", as: "stopwatch"
  get "/decks/:id/questions", to: "decks#questions", as: "deck_questions"
  post "/decks/:id/completed", to: "decks#completed", as: "deck_completed"
  get "/decks/:deck_id/racetracks/new", to: "racetracks#new", as: "new_racetrack"
  post "/decks/:deck_id/racetracks", to: "racetracks#create", as: "deck_racetracks"
  patch "/racetracks/:id", to: "racetracks#update", as: "update_racetrack"
  get "/racetracks/history", to: "racetracks#history", as: "history_racetrack"
  get "/racetracks", to: "racetracks#index", as: "racetracks"
end
# resources :bookings, only: [:index, :show, :edit, :update, :destroy]
# resources :posters, only: [:index, :show, :create, :new] do
#  resources :bookings, only: [:new, :create]
# end
# get "/booking_confirmation/:id", to: "bookings#booking_confirmation", as: "booking_confirmation"
# end
