Rails.application.routes.draw do

  #顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  

  root to: 'public/practice_posts#index'
  get "about", to: "homes#about", as: "about"

  scope module: :public do
    
    get '/users/golfnotes' => 'users#index'
    get '/users/:id' => 'users#show', as: 'user'
    get '/users/info/edit' => 'users#edit'
    get '/users/confirm' => 'users#confirm'

    resources :practice_posts, only: [:new, :create, :show, :edit, :index, :update, :destroy]
    resources :users, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
