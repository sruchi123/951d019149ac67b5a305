Rails.application.routes.draw do
  namespace :api, path: '/api' do

    get 'users', to: 'users#index' #to get all users
    get 'typeahead/:input', to: 'users#typeahead' # for typeahead search
    post 'user', to: 'users#create' # for create user
    get 'user/:id', to: 'users#show' # for return single user
    put 'user/:id', to: 'users#update' # for update single user
    delete 'user/:id', to: 'users#destroy' # for remove user from db
    
  end
end
