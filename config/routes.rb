Rails.application.routes.draw do
  resources :tournaments

  namespace :admin do
    root 'application#index'

    resources :tournaments
  end
end
