Rails.application.routes.draw do

  #devise関連（顧客用）
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #devise関連（管理者用）
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #ゲストユーザーログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  #About page
  get "about", to: "homes#about", as: "about"
  
  #顧客側routing
  scope module: :public do
    root to: 'practice_posts#index'

    get "search_tag" => "practice_posts#search_tag"
    get "search", to: "searches#search", as: "search"
    get '/users/:id/confirm' => 'users#confirm', as: :user_confirm
    patch 'users/unsubscribe' => 'users#unsubscribe'
    get "maps", to: "maps#index"

    resources :practice_posts, only: [:new, :create, :show, :edit, :index, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :notifications, only: [:update]
    resources :contacts, only: [:new, :create, :show]
    resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
      resource :permits, only: [:create, :destroy]
      resource :group_users, only: [:create, :destroy]
      get "new/mail" => "groups#new_mail"
      get "send/mail" => "groups#send_mail"
      get "permits" => "groups#permits"
    end
  end

  #管理者側routing
  namespace :admin do
    root to: 'users#index'
    resources :users, only: [:index, :show, :edit, :update]
    resources :groups, only: [:index, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :tags, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
