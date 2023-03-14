Rails.application.routes.draw do
  mount API::Base, at: "/"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  get "/home", to: "home#index"
  get "/team", to: "home#team"
  get "/about", to: "home#about"
  resources :contact_us
  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    get "/authorize", to: "authorize#index"
    patch "/reply", to: "contact_us#reply"
    get "authorize/:id/edit", to: "authorize#edit"
    resources :contact_us
  end
  namespace :seller do
    get "/dashboard", to: "dashboard#index"
    get "/profile", to: "profile#index" 
    get "/profile/:id/edit", to: "profile#edit" 
    resources :services 
    resources :bookings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
