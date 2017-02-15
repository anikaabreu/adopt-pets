Rails.application.routes.draw do
  resources :pets
  resources :users
  resources :favorites
  
  root "pets#show"
  get '/randompet' => 'pets#random'
  get '/favoritepet/:pet_id' => 'favorites#like', as: 'favorite_pet'
  get '/signup' => 'users#new'
  get '/favorites' => 'favorites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
