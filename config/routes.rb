Rails.application.routes.draw do
  resources :personalities
  mount ForestLiana::Engine => '/forest'
  devise_for :admins
  devise_for :users
  root to: "pages#home"
  # devise_for :users, controllers: {registrations: "users/registrations"}
  # devise_for :admins, controllers: {registrations: "admins/registrations"}
  # devise_for :users, controllers: {registrations: "users/registrations"}
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "sessions#create"
  post "/login", to: "sessions#create"
  # get 'admin' => 'admin#primary', as: :admin_root
  get '/personality' => 'personalities#index', as: :classified

  get 'users' => 'users#primary', as: :user_root
  get 'admins' => 'admin#primary', as: :admin_root
  get 'podcasts' => 'users#bumper', as: :bumper
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
