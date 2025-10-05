Rails.application.routes.draw do
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
  end
  #顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  

  root to: 'homes#top'
  get "about", to: "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
