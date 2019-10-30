Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users' => 'users#index', as: :user_root # creates user_root_path
  get 'reactions/new' => 'reactions#new'
  post 'reactions/new' => 'reactions#create'
  post '/addlike', to: 'posts#add_like', as: 'addlike'

  post '/addfriend', to: 'friendships#send_friend_request', as: 'addfriend'
  post '/cancelfriend', to: 'friendships#cancel_friend_request', as: 'cancelfriend'
  get '/friendrequests', to: 'friendships#friend_requests', as: 'friendrequests'
  post '/acceptfriend', to: 'friendships#accept_friend'
  post '/deletefriend', to: 'friendships#delete_friend'
  get '/friends',to: 'users#show_friends'
  resources :comments,only: [:new,:create]

  root 'posts#index'

  #devise_scope :user do
  #  root 'devise/sessions#new'
  #end
  resources :posts, only: [:new, :create, :index, :show, :destroy]
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
