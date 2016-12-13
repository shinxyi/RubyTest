Rails.application.routes.draw do
  # root :to => 'products#index'
  # get '/products/new' => 'products#new'
  # get '/products/:id' => 'products#show'
  # get '/products/:id/edit' => 'products#edit'
  # post '/products' => 'products#create'
  # patch '/products/:id' => 'products#update'
  # delete '/products/:id' => 'products#destroy'

  root :to => 'products#index'
  resources :products

  get '/comments' => 'comments#index'
  post '/comment/:id' => 'comments#add'
end
