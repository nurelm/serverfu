Serverfu4::Application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
