Serverfu4::Application.routes.draw do
  devise_for :users
  get "overview/index"
  root to: "overview#index"

  resources :credential_types
  resources :credentials
  resources :ips
  resources :domains
  resources :sites
  resources :clients
  resources :servers
  resources :hosts
  resources :notes
  resources :contacts
  resources :phones
  resources :emails
  resources :addresses
  resources :states
end
