Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'
    
  resources :companies, only: [:index, :new, :create, :show]
   
  resources :ports

  resources :ports do 
    resources :missions, only: [:index, :show]
  end  
  
  resources :missions 

  patch '/missions/:id', to: 'mission#update'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  get '/signup', to: 'companies#new'
  post '/signup', to: 'companies#create'
  get 'authorized', to: 'sessions#page_requires_login'

  get '/auth/github/callback', to: 'sessions#create'
end
