Links::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
end
