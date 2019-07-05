# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :sites
  resources :websites do
    resources :menus
    resources :pages
  end

  get '/contact', to: 'static_pages#contact'
  get '/dashboard', to: 'static_pages#dashboard'
  get '/settings', to: 'static_pages#settings'
  root to: 'static_pages#index'
end
