Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help',  to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    # memberの場合:idを含むがcollectionの場合は:idを含まない
    member do
      # /users/:id/...
      # GET /users/:id/following
      # GET /users/:id/followers
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  # GET /account_activations/:id/edit
  # params[:id] <== 有効化トークン
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
