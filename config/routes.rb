Rails.application.routes.draw do
  resources :websites_controller
  root to: 'websites_controller#index'
end
