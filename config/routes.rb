Rails.application.routes.draw do

root 'welcome#index'

# resources :users, only: [:new]

post '/', to: 'sessions#create'

get '/dashboard', to: 'dashboard#index'
get '/logout', to: 'sessions#destroy'

get '/discover', to: 'discover#index'

post '/friends', to: 'friends#create'

get '/register', to: 'users#new'
post '/register', to: 'users#create'
end
