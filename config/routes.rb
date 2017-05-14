Rails.application.routes.draw do
  devise_for :users
  resources :websites
  root to: 'websites#index'
end
