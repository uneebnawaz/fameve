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
  get "/guide", to: "home#guide"
  devise_scope :user do
    post '/check_email_availability', to: 'users/registrations#check_email_availability'
  end
  resources :contact_us
  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    get "/authorize", to: "authorize#index"
    patch "/authorize/:id/edit", to: "authorize#edit"
    get "/reviews", to: "reviews#index"
    patch "/reply", to: "contact_us#reply"
    resources :reviews
    resources :contact_us
  end
  namespace :advisor do
    get "/dashboard", to: "dashboard#index"
    resources :advises
  end
  namespace :seller do
    get "/dashboard", to: "dashboard#index"
    get "/profile", to: "profile#index" 
    get "/profile/:id/edit", to: "profile#edit" 
    patch "/request_reply", to: "post_requests#request_reply"
    get "/sales", to: "services#view_sales"
    resources :services 
    resources :bookings
    resources :post_requests
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
