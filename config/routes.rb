Rails.application.routes.draw do
  resources :lists do
    resources :items
  end
  namespace :list do
    resources :items
  end
  get 'about/index'
  devise_for :users
  root "home#index"
end
