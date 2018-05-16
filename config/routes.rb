Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/test', to: 'test#index'
  put '/test', to: 'test#put'

  post '/mongo_put', to: 'test#mongo_insert'
end
