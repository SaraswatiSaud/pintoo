Rails.application.routes.draw do
  devise_for :users
  resources :sites
  resources :websites do
    resources :pages
  end
  resources :menu_items


  get '/contact', to: 'static_pages#contact'
  get '/dashboard', to: 'static_pages#dashboard'
  root to: 'static_pages#index'
end
