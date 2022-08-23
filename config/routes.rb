Rails.application.routes.draw do
  devise_for :users
  # devise_for :installs
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :workspaces do
    resources :bookings
  end
end
