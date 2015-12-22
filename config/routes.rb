Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects

  get 'welcome/index'
  root 'welcome#index'
end
