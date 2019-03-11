Rails.application.routes.draw do

  root :to => "users#top"
  get "admins/top" => "admins#top"

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

  # trips
  get "/trips/list/:id" => "trips#list", as: "list"
  post "/trips/list" => "trips#list_create", as: "list_create"
  put "/trips/list/:id" => "trips#list_update", as: "list_update"
  post "/trips/data" => "trips#data_create", as: "data_create"
  put "/trips/data/:id" => "trips#data_update", as: "data_update"
  resources :trips, only: [:index, :create, :show, :edit, :update, :destroy]

  #maps
  get "/world" => "trips#world", as:"world"
  get "/area/asia" => "trips#area_asia", as:"asia"
  get "/area/middle_east" => "trips#area_middle_east", as:"middle_east"
  get "/area/europe" => "trips#area_europe", as: "europe"
  get "/area/africa" => "trips#area_africa", as: "africa"
  get "/area/north_america" => "trips#area_north_america", as: "north_america"
  get "/area/south_america" => "trips#area_south_america", as: "south_america"
  get "/area/oceania" => "trips#area_oceania", as: "oceania"

  namespace :admin do
    resources :cities, only: [:index, :create, :edit, :update, :destroy]
    resources :activities, only: [:index, :create, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
