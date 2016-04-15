Rails.application.routes.draw do
  root to: "ideas#index"
  resources :users do
  resources :ideas, only: [:destroy, :index, :edit, :update, :new]
end
resources :ideas, only: [:index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
