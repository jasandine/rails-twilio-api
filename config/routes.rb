Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :users
  resources :messages, :only => [:index, :new, :create, :show]
end
