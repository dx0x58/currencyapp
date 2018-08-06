Rails.application.routes.draw do
  root 'currencies#index'

  namespace :admin do
    root 'currencies#index'
    resources :currencies, only: %i[create update]
  end
end
