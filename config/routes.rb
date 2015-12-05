Rails.application.routes.draw do
  resources :user_events
  resources :pages
  resources :venues
  resources :festivals
  resources :events
  resources :users


  get 'submit_event' => 'submit_event#index', as: :submit_event
  get 'sessions' => "sessions#destroy", as: :logout
  get '/admin' => 'admin#index'
  get 'user_events' => 'user_events#new'

  namespace :admin do
    resources :venues, :festivals, :events, :users, :festivals, :pages
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
