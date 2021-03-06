Rails.application.routes.draw do

  resources :topics, only: [:show, :index] 

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfs, except: [:show, :index] 

  put 'portfolios/sort', to: 'portfs#sort'

  get 'portfolios', to: 'portfs#index', as: 'portfolio_index'
  get 'portfolio/:id', to: 'portfs#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
