Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :entries, only: [:index, :create]
  end
  root 'events#index'
end
