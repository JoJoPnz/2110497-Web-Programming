Rails.application.routes.draw do
  get 'main/test1'
  get 'main/test2'
  get 'main/test3'
  get 'main/test4'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'test1' , to: 'main#test1'
  get 'test2' , to: 'main#test2'
  get 'test3' , to: 'main#test3'
  get 'test4' , to: 'main#test4'
  get 'main/calculator', to: 'main#calculator'
  # Defines the root path route ("/")
  # root "articles#index"
end
