Rails.application.routes.draw do

  get 'items/create'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end
  
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root to: 'welcome#index'
end
