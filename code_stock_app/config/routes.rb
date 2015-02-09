Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :posts
  # change below to only certain resources (e.g. can't delete a library)
  resources :libraries

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/posts/:id/add_to_library' => 'libraries#add'
  post '/posts/:id/remove_from_library' => 'libraries#remove'
end
