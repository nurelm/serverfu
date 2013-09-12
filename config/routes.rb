Serverfu4::Application.routes.draw do
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
