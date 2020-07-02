Rails.application.routes.draw do
  root 'books#index'

  get '/buyers/signup', to: 'buyers#new'
  get '/sellers/signup', to: 'sellers#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :buyers
  resources :sellers
end
