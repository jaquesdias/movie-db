Rails.application.routes.draw do
  devise_for :users

  root 'movies#index'

  resources :movies do
    post 'rate', to: 'movies#rate', as: :rate
  end
end
