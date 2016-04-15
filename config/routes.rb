Rails.application.routes.draw do
  root to: "ideas#index"
  #an admin can crud all ideas not just a specific user
  #namespace an admin
#user can have added attribute user_type: 0, 1 (ideally boolean)
#admin column with true or false

  resources :users do
  resources :ideas, only: [:destroy, :index, :edit, :update, :new]
end
resources :ideas, only: [:index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
