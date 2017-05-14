Rails.application.routes.draw do
  devise_for :users
  resources :websites

  get '/contact', to: 'static_pages#contact'
  root to: 'static_pages#index'
end
