Rails.application.routes.draw do
  resources :tournaments

  namespace :admin do
    root 'application#index'

    resources :tournaments
    resources :countries
    resources :organizations
  end
end
