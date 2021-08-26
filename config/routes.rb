Rails.application.routes.draw do

root 'welcome#index'

# resources :users, only: [:new]

post '/', to: 'users#login'

get '/dashboard', to: 'dashboard#index'

get '/register', to: 'users#new'
post '/register', to: 'users#create'
end
