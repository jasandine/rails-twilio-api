Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"


  resources :users do
    resources :contacts, :only => [:index, :new, :create, :show]
  end

  resources :contacts do
    resources :messages, :only => [:index, :new, :create, :show]
  end
end
