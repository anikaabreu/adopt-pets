Rails.application.routes.draw do
  resources :pets
  resources :users

  root "pets#show"

  post '/favoritepet/:pet_id' => 'favorites#like', as: 'favorite_pet'
  get '/signup' => 'users#new'
  get '/favorites' => 'favorites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
