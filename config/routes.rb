Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/libraries/:id/books', to: "library_books#index"
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'
  patch '/libraries/:id', to: 'libraries#update'
  get '/libraries/:id/books/new', to: 'library_books#new'
  post '/libraries/:id/books', to: 'library_books#create'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
end
