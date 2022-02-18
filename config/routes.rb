Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new]
  root 'events#index'
end
