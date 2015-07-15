Rails.application.routes.draw do
  namespace :admin do
  get 'events/index'
  end

  resources :venues, :festivals, :events, :users

  get 'submit_event' => 'submit_event#index', as: :submit_event
  get 'sessions' => "sessions#destroy", as: :logout

  get '/admin' => 'admin#index'

  namespace :admin do
    resources :events
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
  end

  get "sessions/create"
  get "sessions/destroy"

  get 'home/index'
  root 'home#index'

end
