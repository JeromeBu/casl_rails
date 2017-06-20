Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :activities, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :inscriptions, only: [:new, :create, :index]
    get 'get_xlsx', to: 'inscriptions#get_xlsx'
    resources :articles, only: [:new, :create]
  end

  resources :grown_activities, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :grown_inscriptions, only: [:new, :create, :index]
    get 'get_xlsx', to: 'inscriptions#get_xlsx'
    resources :grown_activity_articles, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :children, only: [:index, :create]
  end

  resources :children, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
