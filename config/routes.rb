Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  mount Attachinary::Engine => "/attachinary"
  root to: 'activities#index'

  resources :activities, only: [:index, :show, :new, :create, :edit, :update] do
    resources :inscriptions, only: [:new, :create, :index]
    get 'get_xlsx', to: 'inscriptions#get_xlsx'
    resources :articles, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :children, only: [:index, :new, :create, :edit, :update]
  end

  resources :children, only: [:edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
