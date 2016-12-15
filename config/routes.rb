Rails.application.routes.draw do


  get 'purchases/create'

  get '/main' => 'sessions#index'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  post '/users' => 'users#create'
  get '/dashboard/:user_id' => 'users#dashboard'

  get '/shoes' => 'shoes#index'
  post '/shoes' => 'shoes#create'
  delete '/shoes/:shoe_id' => 'shoes#destroy'

  post '/purchases/:shoe_id' => 'purchases#create'
end
