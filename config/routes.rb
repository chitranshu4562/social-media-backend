Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1 do
      post 'users/user_signup'
      post 'users/user_login'

      get 'places/places_details'
      post 'places/create_favorite_places'
    end
  end
  root 'users#index'
  resources :places
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
