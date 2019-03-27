Rails.application.routes.draw do

  root :to => 'home#top'
  get 'top' => 'users#top'
  get 'admins/top' => 'admins#top'

  get 'plan/:id' => "users#plan", as:"plan"

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
}
  devise_for :users, :controllers => {
    sessions:      'users/sessions',
    registrations: 'users/registrations',
    passwords:     'users/passwords'
  }

  resources :users, only: [:show, :update, :edit] do
    member do
     get :following, :followers
    end
  end
   resources :relationships, only: [:create, :destroy]


  #likes
  get "favorites/:id/" => "trips#favorite_trips", as:"favorite_trips"
  #tag
  get "trips/tag/:id" => "trips#index_tag", as:"index_tag"
  #nothing view
  get "trips/:id/result" => "trips#result", as:"result_trip"
  #search
  get "search/:id/" => "trips#search", as:"search"

  resources :trips, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :favorite_trips, only: [:create, :destroy]
  end

  resources :lists


  namespace :admin do
    resources :cities, only: [:index, :create, :edit, :update, :destroy]
    resources :activities, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
