Rails.application.routes.draw do

  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'products/info', to: 'products#info'
      get 'products/find/:slug', to: 'products#find'
      get 'products/(:page)', to: 'products#index', defaults: {page: 1}, constraints: {order: ['name', 'name desc', 'price', 'price desc']}
      post 'products/buy', to: 'products#buy'
      get 'users/current', to: 'users#current'
      get 'users/address/:zip_code', to: 'users#get_address'
      get 'orders', to: 'orders#index'
      post 'orders/create', to: 'orders#create'

    end
  end

end
