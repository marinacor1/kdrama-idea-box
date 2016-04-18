Rails.application.routes.draw do
  root to: "home#show"
  #an admin can crud all ideas not just a specific user
  #namespace an admin
#user can have added attribute user_type: 0, 1 (ideally boolean)
#admin column with true or false
  resources :users, except: [:new]
  resources :ideas
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
  end
end
