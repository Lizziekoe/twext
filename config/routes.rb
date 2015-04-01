Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users , :only => [:show]

  resources :contacts, :only => [:new, :create]
  resources :texts , :only => [:new, :create]

end
