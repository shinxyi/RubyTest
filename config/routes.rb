Rails.application.routes.draw do

  root 'sessions#index'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  get '/professional_profile' => 'users#dashboard'
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  # get '/users/:id/edit' => 'users#edit'
  # patch '/users/:id' => 'users#update'
  # delete '/users/:id' => 'users#destory'

  post '/networks/:associate_id' => 'networks#create'
  patch '/networks/:associate_id' => 'networks#update'
  delete '/networks/:associate_id' => 'networks#destroy'

end
