# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    resources :caronas
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    resources :campus
    get 'user/index'
    get 'welcome/index'
  end

  devise_for :users
  devise_for :admins
  root 'site/welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
