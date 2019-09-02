Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post 'search', to: 'pages#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :combos, only: [ :index, :new, :create ] do
    member do
      post "like" => "combos#upvote"
      post "downvote" => "combos#downvote"
      # put "select" => 'combos#upvote_select'
    end
  end
  resource :profile, only: :show
end
