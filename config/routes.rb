Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  resources :companies, [:new, :create, :show]
  resources :docks
  resources :docks do
    recources :missions
  end 

  

  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
