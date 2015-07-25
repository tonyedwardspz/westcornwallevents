Rails.application.routes.draw do
  namespace :admin do
    resources :pages
  end
  resources :pages
  resources :venues
  resources :festivals
  resources :events
  resources :users

  get 'submit_event' => 'submit_event#index', as: :submit_event
  get 'sessions' => "sessions#destroy", as: :logout
  get '/admin' => 'admin#index'

  namespace :admin do
    resources :venues, :festivals, :events, :users, :festivals
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
