Rails.application.routes.draw do
  devise_for :users

  root 'movies#index'

  resource :movies
end
