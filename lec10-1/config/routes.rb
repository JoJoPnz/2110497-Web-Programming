Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_Item', to: 'main#user_Items'
  # Defines the root path route ("/")
  # root "articles#index"
end
