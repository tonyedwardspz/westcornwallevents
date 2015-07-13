Rails.application.routes.draw do
  resources :venues, :festivals, :events, :users

  get 'submit_event' => 'submit_event#index', as: :submit_event

  get 'admin' => 'admin#index'

  get 'sessions' => "sessions#destroy", as: :logout

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"

  get 'admin/index'

  get 'home/index'
  root 'home#index'

end
