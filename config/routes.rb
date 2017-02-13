Rails.application.routes.draw do
  # resources :pets
  resources :users
  get '/pet' => "pets#show"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
