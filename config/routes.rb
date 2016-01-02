Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts
    resources :projects
  end

  resources :contacts, only: [:new, :create]
 
  get 'welcome/index' 
  root 'welcome#index'

   get 'posts/theposts' => 'posts#theposts'
   get 'projects/theprojects' => 'projects#theprojects'

  get '*path' => redirect('/')
end
