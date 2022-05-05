# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    resources :caronas do
      get 'destroy' => 'caronas#destroy'
    end
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    resources :campus do
      get 'destroy' => 'campus#destroy'
    end
    resources :users do
      get :autocomplete_user_iduff, on: :collection
      get :autocomplete_user_email, on: :collection
      get 'destroy' => 'users#destroy'
    end
    resources :admins do
      get 'destroy' => 'admins#destroy'
    end

    get 'welcome/index'
    root 'admins_backoffice/welcome#index'
  end

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :admins

  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  root 'site/welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
