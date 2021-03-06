Rails.application.routes.draw do

  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      post 'applications/update/:id/:act_method', to: 'applications#update'
      post 'companies/create', to: 'companies#create'
      get 'company/jobs', to: 'companies#jobs'
      get 'company/job/:slug', to: 'companies#job'
      post 'jobseekers/create', to: 'jobseekers#create'
      get 'jobseekers/applications', to: 'jobseekers#applications'
      post 'applications/apply', to: 'applications#apply'
      get 'jobs/info', to: 'jobs#info'
      get 'jobs/find/:slug', to: 'jobs#find'
      post 'jobs/create', to: 'jobs#create'
      get 'jobs/(:page)', to: 'jobs#index', defaults: {page: 1}, constraints: {order: ['name', 'name desc', 'price', 'price desc']}
      post 'jobs/buy', to: 'jobs#buy'
      get 'users/current', to: 'users#current'
      get 'users/address/:zip_code', to: 'users#get_address'
      get 'orders', to: 'orders#index'
      post 'orders/create', to: 'orders#create'
      get 'addresses/states', to: 'addresses#states'
      get 'addresses/state/:id/cities', to: 'addresses#cities'

    end
  end

end
