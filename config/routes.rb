Rails.application.routes.draw do

  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'jobs/info', to: 'jobs#info'
      get 'jobs/find/:slug', to: 'jobs#find'
      get 'jobs/(:page)', to: 'jobs#index', defaults: {page: 1}, constraints: {order: ['name', 'name desc', 'price', 'price desc']}
      post 'jobs/buy', to: 'jobs#buy'
      get 'users/current', to: 'users#current'
      get 'users/address/:zip_code', to: 'users#get_address'
      get 'orders', to: 'orders#index'
      post 'orders/create', to: 'orders#create'

    end
  end

end
