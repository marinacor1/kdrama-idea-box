Rails.application.routes.draw do
  root to: "ideas#index"
  resources :ideas
  resources :users
end
