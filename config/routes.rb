Rails.application.routes.draw do

  root 'sessions#index'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/events' => 'events#index'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show'
  get '/events/:id/edit' => 'events#edit' #no need to make
  delete '/events/:id' => 'events#destroy'

  post '/comments' => 'comments#create'

  post '/rosters/:event_id' => 'rosters#create'
  delete '/rosters/:event_id' => 'rosters#destroy'

end
