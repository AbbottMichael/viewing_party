Rails.application.routes.draw do

root 'welcome#index'

resources :users, only: [:new]

post '/', to: 'users#login'

get '/dashboard', to: 'dashboard#index'
end
