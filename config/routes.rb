Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'activities#index'
  resources :activities, only: [:index, :show, :new, :create, :edit, :update] do
    resources :inscriptions, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :children, only: [:new, :create, :edit, :update]
  end
  resources :children, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
