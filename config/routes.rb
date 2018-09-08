Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/locate_infos', to: 'locate_infos#index'
  post '/locate_infos', to: 'locate_infos#create'
  get '/locate_infos/find_my_shabon', to: 'locate_infos#find_my_shabon'
  get '/locate_infos/:id', to: 'locate_infos#show'
 
  

  post '/admin', to: 'admin_users#create'

  post '/nayami_comments', to: 'nayami_comments#create'
end
