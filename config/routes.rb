Rails.application.routes.draw do
  devise_for :users
  resources :websites_controller
  root to: 'websites_controller#index'
end
