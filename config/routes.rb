Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'my_portfolio', to: "users#my_portfolio"        # Users stock portfolio page

  get 'search_stocks', to: "stocks#search"

  resources :user_stocks, only: [:create, :destroy]   # Routes for Create, and destroy stocks records

end
