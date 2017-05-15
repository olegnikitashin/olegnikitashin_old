Rails.application.routes.draw do
  root to: 'blogs#index'

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
end
