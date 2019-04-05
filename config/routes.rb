Rails.application.routes.draw do

  root :to => 'home#top'
  get 'top' => 'users#top'
  get 'admins/top' => 'admins#top'

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

  #search with pages
  get "search/:id/" => "trips#search", as:"search"
  #user's favorites with pages
  get "favorites/:id/" => "trips#favorite_trips", as:"favorite_trips"
  #user's trips with pages
  get 'plan/:id' => "users#plan", as:"plan"
  #no view
  get "trips/:id/result" => "trips#result", as:"result_trip"

  resources :trips, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :favorite_trips, only: [:create, :destroy]
  end

  resources :lists

  namespace :admin do
    resources :cities, only: [:index, :create, :edit, :update, :destroy]
    resources :activities, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :destroy]
    #trips and lists
    get    "trips/:id"      => "trips#index",        as:"trip"
    get    "trips/:id/edit" => "trips#trip_edit",    as:"edit_trip"
    patch  "trips/:id"      => "trips#trip_update",  as:"update_trip"
    delete "trips/:id"      => "trips#trip_destroy", as:"destroy_trip"
    get    "lists/:id/edit" => "trips#list_edit",    as:"edit_list"
    patch  "lists/:id"      => "trips#list_update",  as:"update_list"
    delete "lists/:id"      => "trips#list_destroy", as:"destroy_list"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
