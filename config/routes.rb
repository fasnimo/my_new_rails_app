Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'
    
  resources :companies, only: [:index, :new, :create, :show]
  resources :docks
  resources :missions 

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  get '/signup', to: 'companies#new'
  post '/signup', to: 'companies#create'

  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
