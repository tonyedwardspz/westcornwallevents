Rails.application.routes.draw do
  namespace :admin do
    resources :festivals
  end
  resources :venues, :festivals, :events, :users

  get 'submit_event' => 'submit_event#index', as: :submit_event
  get 'sessions' => "sessions#destroy", as: :logout
  get '/admin' => 'admin#index'

  # get '/venues' => 'venues#index'
  # get '/venues/:id' => 'venues#show'

  # get '/festivals' => 'festivals#index'
  # get '/festivals/:id' => 'festivals#show'

  # get '/events' => 'events#index'
  # get '/events/:id' => 'events#show'

  namespace :admin do
    resources :venues, :festivals, :events, :users
    get 'events/index'
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
