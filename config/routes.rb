Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'

  get '/caesars' => 'caesars#index'
  get '/caesars/new' => 'caesars#new'
  post 'caesars/new' => 'caesars#create'

  resources :caesars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
