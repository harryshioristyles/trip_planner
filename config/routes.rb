Rails.application.routes.draw do



  get 'trips/index'
  get 'trips/create'
  get 'trips/show'
  get 'trips/edit'
  get 'trips/update'
  get 'trips/destroy'
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

  namespace :admin do
    resources :cities, only: [:index, :create, :edit, :update, :destroy]
    resources :activities, only: [:index, :create, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
