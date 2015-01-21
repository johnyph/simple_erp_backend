Rails.application.routes.draw do
  # Api
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api'}, path: '/' do
    

  end
end
