Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'main/login'
  post 'main/create'
  post 'main/user_Item_delete', to: 'main#user_Item_delete'
  get 'main/destroy'
  get 'main/user_Item', to: 'main#user_Items'

  get 'shop/:id', to: 'main#show_shop'
  post 'main/buy_item', to: 'main#buy_item'

  get 'main/inventories', to: 'main#show_inventory'

  # Defines the root path route ("/")
  # root "articles#index"
end
