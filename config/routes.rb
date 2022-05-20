# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  namespace :users_backoffice do
    resources :users, only: %i[show edit] do
      resources :caronas do
        resources :points
        get 'users_backoffice/desabilitar_carona/:carona_id', to: 'caronas#destroy',
                                                              as: :destroy_carona
      end
      get '/search', to: 'caronas#search', as: :search_carona
    end
  end
  namespace :admins_backoffice do
    resources :campus do
      get 'admins_backoffice/desabilitar_campu/:campu_id', to: 'campus#destroy', as: :destroy_campu
      get 'admins_backoffice/reativar_campu/:campu_id', to: 'campus#reactive', as: :reactive_campu
    end
    resources :users do
      get 'admins_backoffice/desabilitar_user/:user_id', to: 'users#destroy', as: :destroy_user
      get 'admins_backoffice/reativar_user/_user_id', to: 'users#reactive', as: :reactive_user
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
