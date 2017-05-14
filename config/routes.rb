Rails.application.routes.draw do
  get 'static_pages/contact'

  devise_for :users
  resources :websites
  root to: 'static_pages#index'
end
