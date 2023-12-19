Rails.application.routes.draw do
  get 'menucard/index', as:'menu'

  get 'files/file_upload',as:'show_upload'
  
  post 'files/create',as:'file_upload'
  root 'files#index', as:'root'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
  namespace :v1 do
    post 'csv/renderError'
  end
  end

end
