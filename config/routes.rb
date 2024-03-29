Rails.application.routes.draw do
  resources :pets
  resources :users
  resources :favorites

  root "pets#show"
  get '/randompet' => 'pets#random'
  get '/favoritepet/:pet_id' => 'favorites#like', as: 'favorite_pet'
  get '/favorites' => 'favorites#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
