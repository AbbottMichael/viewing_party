Rails.application.routes.draw do

root 'welcome#index'

post '/', to: 'sessions#create'

get '/dashboard', to: 'dashboard#index'

get '/logout', to: 'sessions#destroy'

get '/discover', to: 'discover#index'

post '/friends', to: 'friends#create'

get  '/register',  to: 'users#new'
post '/register', to: 'users#create'

resources :movies, only: [:index, :show]

post '/movies', to: 'movies#index'

get  '/viewing-party/new',  to: 'events#new'
post '/viewing-party/new', to: 'events#create'

end
