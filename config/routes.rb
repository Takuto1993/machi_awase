Rails.application.routes.draw do
  namespace :user do
    get 'nice_coupons/index'
  end
  root 'user/homes#top'

  get '/admin' => 'admin/homes#top'

  get 'search' => 'places#search'

  get '/users/unsubscribe' => 'user/users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdraw' => 'user/users#withdraw', as: 'withdraw'

  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  #ユーザー側
  scope module: :user do
    resources :places, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :join_places, only: [:create, :destroy]
      resources :place_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :join_places, only: [:index]
    resources :coupons, only: [:index, :show] do
      resource :nice_coupons, only: [:create, :destroy]
    end
    resources :nice_coupons, only: [:index]
  end

  #管理者側
  namespace :admin do
    resources :places, only: [:index, :show, :edit, :update, :destroy] do
      resource :join_places, only: [:create, :destroy]
      resources :place_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      patch :toggle
    end
    resources :join_places, only: [:index]
    resources :coupons, only: [:index, :show, :edit, :new, :update, :destroy, :create]
  end

  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:passwords] , controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
