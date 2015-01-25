require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
 
  # Api
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api'}, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, except: [:index]
      resources :sessions, only: [:create, :destroy]
      resources :organizations, except: [:index]
      resources :customers
    end
  end
end
