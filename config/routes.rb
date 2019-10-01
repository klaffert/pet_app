Rails.application.routes.draw do
  resources :pets
  resources :favorites
  post '/favorites', to: 'favorites#create'
  resources :users
  resources :tokens, only: [:create]
  post "/search" => "pets#search"
  get 'tokens/create'
  post 'users/add' => 'users#add'
  post 'users' => 'users#create'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
