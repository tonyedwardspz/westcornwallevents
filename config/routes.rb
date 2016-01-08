Rails.application.routes.draw do
  namespace :admin do
  get 'settings/general'
  end

  namespace :admin do
  get 'settings/adminUsers'
  end

  resources :user_events, only: [:new, :create, :show]
  resources :pages, only: [:index, :show]
  resources :venues, only: [:index, :show]
  resources :festivals, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :blogs, only: [:index, :show]


  get 'submit_event' => 'user_events#new', as: :submit_event
  get 'sessions' => "sessions#destroy", as: :logout
  get '/admin' => 'admin#index'
  get 'user_events' => 'user_events#new'

  namespace :admin do
    resources :venues, :festivals, :events, :users, :festivals, :pages, :user_events, :event_users, :blogs
    get 'user_events/show'
    get 'user_events/index'
    get 'events/index'
    post 'events/reprocess_images' => 'events#reprocess_images', as: :reprocess_images
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
  end

  get "sessions/create"
  get "sessions/destroy"

  get 'home/index'
  root 'home#index'

  get '/festival' => redirect('/festivals')
end
