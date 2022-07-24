Rails.application.routes.draw do
  root 'user/homes#top'
  get '/admin' => 'admin/homes#top'

  scope module: :user do
    resources :places, only: [:new, :create, :index, :show, :edit, :update, :destroy]
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
