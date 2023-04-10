Rails.application.routes.draw do
  resources :places
  resources :users
  namespace :api do
    namespace :v1 do
      get 'places/places_detail'
      post 'places/create_favorite_places'

      post 'users/user_signup'
      post 'users/user_login'

    end
  end
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
