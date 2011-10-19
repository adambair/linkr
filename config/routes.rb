Linkr::Application.routes.draw do
  match '/signup' => 'users#new'
  match '/login'  => 'sessions#new'
  match '/logout' => 'sessions#destroy'

  match '/help'      => 'pages#help'
  match '/dashboard' => 'dashboard#show'

  resources :users,    :only => [:new, :create, :show, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tags, :only => [:index, :show]

  resources :bookmarks do
    get :save, :on => :member
    get :bookmarklet, :on => :collection
  end

  root :to => 'pages#index'
end
