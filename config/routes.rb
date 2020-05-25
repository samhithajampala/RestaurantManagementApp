Rails.application.routes.draw do
  #get 'customers/customer'
  #get 'customers/firstname:string'
  #get 'customers/lastname:'
  #get 'customers/string'
  #get 'customers/mobile:string'
  #get 'customers/house_apt_no:string'
  ##get 'customers/street:string'
  #get 'customers/city:string'
  #get 'customers/state:string'
  #get 'customers/pincode:string'
  #get 'customers/username:string'
  #get 'customers/pwd:string'
  #resources:login
  get '', to: 'application#index'
get '/users', to:'users#index'
post '/users', to:'users#create'
post '/users/verify', to:'users#verify'
get '/users/new' ,to:'users#new'
post '/users/create', to:'users#create'
get '/users/admin', to:'users#admin'
post '/users/admin/workers/update', to:'workers#update'
get '/users/admin/workers/update', to:'workers#update'
resources :users
post '/workers/new' , to:'workers#new'
post '/workers/create' , to:'workers#create'
resources :workers
post '/customers/:id/select' , to:'customers#select'
post '/customers/:id/track' , to:'customers#track'
get '/customers/:id/track' , to:'customers#track'
get '/customers/:id/track_order' , to:'customers#track_order'
resources :customers
post '/customers/:id/booked_items/create' , to:'booked_items#create'
post '/customers/:id/edit' , to:'customers#edit'
post '/customers/:id/update' , to:'customers#update'
get '/workers/:id/booked_items/myupdate' , to:'booked_items#myupdate'
#post '/users/admin/workers/update_salaries' , to:'workers#update_salaries'
post '/users/admin/workers/update_salaries' , to:'workers#update_salaries'
resources :booked_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
