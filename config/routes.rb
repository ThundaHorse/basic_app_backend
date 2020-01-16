Rails.application.routes.draw do
  namespace :api do 
    # Users
    get '/users' => 'users#index'
    get 'users/:id' => 'users#show'
    post '/users' => 'users#create'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    # Posts 
    get '/posts' => 'posts#index'
    get '/posts/:id' => 'posts#show'
    post '/posts' => 'posts#create'
    patch '/posts/:id' => 'posts#update'
    delete '/posts/:id' => 'posts#destroy'
  end 
end
