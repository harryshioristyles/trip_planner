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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
