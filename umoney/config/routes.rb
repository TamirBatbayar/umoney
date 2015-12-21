Rails.application.routes.draw do
  post '/api', to: 'api#index', as: 'api', :defaults => { :format => :json }

  resources :partners
  resources :cards
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
