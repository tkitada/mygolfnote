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
  

  root to: 'public/practice_posts#index'
  get "about", to: "homes#about", as: "about"

  scope module: :public do

    get '/users/:id/confirm' => 'users#confirm', as: :user_confirm
    patch 'users/unsubscribe' => 'users#unsubscribe'
    get "search", to: "searches#search", as: "search"

    resources :practice_posts, only: [:new, :create, :show, :edit, :index, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
