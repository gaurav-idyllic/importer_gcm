Rails.application.routes.draw do
  root 'uploads#index'

  resources :uploads
  get 'companies' => 'companies#index'
  get 'companies/get_data'

  # -- sidekiq routes
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'test123'
  end
  mount Sidekiq::Web => '/sidekiq'
end
