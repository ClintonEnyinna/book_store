Rails.application.routes.draw do
  root 'bookstore_pages#home'

  put '/checkout', to: 'bookstore_pages#buy'

  get '/buyers/signup', to: 'buyers#new'
  get '/sellers/signup', to: 'sellers#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :buyers do
    resources :orders
  end
  resources :sellers
  resources :books
end
