Rails.application.routes.draw do
  resources :articles
  get 'welcome/index'

  # authentication routes
  get 'signup' => 'users#new', as: :new_user
  post 'signup' => "users#create", as: :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # routes which needs authentication
  get 'edit_profile' => "users#edit_profile", as: :edit_profile
  patch 'edit_profile' => "users#update_profile", as: :update_profile
  delete 'delete_profile' => "users#delete_profile", as: :delete_profile
  
  get 'users' => "users#index", as: :user
  get 'user/:id' => "users#show", as: :profile
  get 'user/:id/articles' => "users#show_articles", as: :show_articles

  root "welcome#index"
end
