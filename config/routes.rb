Rails.application.routes.draw do
  resources :articles
  get 'welcome/index'

  # authentication routes
  get 'signup' => 'users#new'
  post 'signup' => "users#create", as: :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'profile' => "users#profile", as: :profile
  get 'edit_profile' => "users#edit_profile", as: :edit_profile
  patch 'edit_profile' => "users#update_profile", as: :update_profile
  get 'user/:id/articles' => "users#show_articles"

  root "welcome#index"
end
