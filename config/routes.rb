Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'portfolio', to: 'users#portfolio'

  get 'search_stock', to: 'stocks#search'

  resources :user_stocks, only: [:create, :destroy]

  resources :users, only: [:show]

  resources :friendships

  get 'friends', to: 'users#friends'

  post 'add_friend', to: 'users#add_friend'

  get 'search_friend', to: 'users#search'

end
