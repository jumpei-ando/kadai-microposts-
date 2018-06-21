Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :microposts, only: [:create, :destroy] do
    #お気に入り登録ユーザ一覧表示のルーティング修正要
    member do
      get :funs
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favs, only: [:create, :destroy]
end
