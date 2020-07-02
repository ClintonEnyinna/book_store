Rails.application.routes.draw do
  get '/buyers/signup', to: 'buyers#new'
  get '/sellers/signup', to: 'sellers#new'

  resources :buyers
  resources :sellers
end
