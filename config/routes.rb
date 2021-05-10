Rails.application.routes.draw do
  
  devise_scope :users do
    resources :lists do
      resources :items
    end
  end
  
  devise_for :users

  get 'about/index'
  root "home#index"
end
