Rails.application.routes.draw do
  get 'welcome/index'

  # authentication routes
  get 'signup' => 'users#new'
  post 'signup' => "users#create", as: :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root "welcome#index"
end
