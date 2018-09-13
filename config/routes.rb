Rails.application.routes.draw do

  post 'user_locates/update', to: 'user_locates#update'

  get 'shabon_alerts/show', to: 'shabon_alerts#show'
  get 'shabon_alerts/:id', to: 'shabon_alerts#fix_alert'

  resources :users
  post '/users/intro_update', to: 'users#intro_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/locate_infos', to: 'locate_infos#index'
  post '/locate_infos', to: 'locate_infos#create'
  get '/locate_infos/find_my_shabon', to: 'locate_infos#find_my_shabon'
  get '/locate_infos/:id', to: 'locate_infos#show'
 
  

  post '/admin', to: 'admin_users#create'

  post '/nayami_comments', to: 'nayami_comments#create'

  post '/profile_images', to: 'profile_images#update'
end
