Rails.application.routes.draw do
  get 'main/test', to: 'main#test'
  post 'main/test', to: 'main#test'
  post 'main/test3', to: 'main#test3'
  get 'score/list', to: 'main#showList'
  get 'score/edit', to: 'main#editSubject'
  post 'score/save', to: 'main#saveSubject'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "main#test2"
end
