Rails.application.routes.draw do
  
  namespace :user do
    get 'users/show'
    get 'users/edit'
  end
  root 'user/homes#top'
  
  get '/admin' => 'admin/homes#top'
  
  #ゲストログイン用
  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  scope module: :user do
    resources :places, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update]
  end
  
  namespace :admin do
    resources :places, only: [:index, :show, :edit, :update, :destroy]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
