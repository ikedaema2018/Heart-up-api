Rails.application.routes.draw do

  post 'user_locates/update', to: 'user_locates#update'

  get 'shabon_alerts/show', to: 'shabon_alerts#show'
  get 'shabon_alerts/:id', to: 'shabon_alerts#fix_alert'

  post '/users/intro_update', to: 'users#intro_update'
  get '/users/one_hour_ago_user', to: 'users#one_hour_ago_user'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/locate_infos', to: 'locate_infos#index'
  post '/locate_infos', to: 'locate_infos#create'
  get '/locate_infos/distance', to: 'locate_infos#distance'
  get '/locate_infos/find_my_shabon', to: 'locate_infos#find_my_shabon'
  get '/locate_infos/push_test', to: 'locate_infos#push_test'
  get '/locate_infos/:id', to: 'locate_infos#show'

  post '/admin', to: 'admin_users#create'

  get '/nayami_comments/my_post', to: 'nayami_comments#my_post'
  get '/nayami_comments/my_shabon_nayami_find', to: 'nayami_comments#my_shabon_nayami_find'
  get '/nayami_comments/fix_yonda_flag/:id', to: 'nayami_comments#fix_yonda_flag'
  post '/nayami_comments', to: 'nayami_comments#create'

  post '/profile_images', to: 'profile_images#update'

  get '/closer_alerts/:id', to: 'closer_alerts#fix_closer'
  get '/closer_alerts', to: 'closer_alerts#user_alert'

  

end
