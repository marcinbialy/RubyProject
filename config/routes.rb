Rails.application.routes.draw do
  resources :portfs, except: [:show, :index]
  get 'portfolios', to: 'portfs#index', as: 'portfolio_index'
  get 'portfolio/:id', to: 'portfs#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
