Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post 'search', to: 'pages#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :combos, only: :index do
    member do
      put "like" => "combos#upvote"
      put "select" => 'combos#upvote_select'
    end
  end
  resource :profile, only: :show
end
