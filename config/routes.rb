Rails.application.routes.draw do

  root :to => 'users#top'
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

  resources :users, only: [:show, :update, :edit]

  get "trips/:id/result" => "trips#result", as:"result_trip"
  resources :trips do
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
