Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'places/places_details'
    end
  end
  root 'places#index'
  resources :places
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
