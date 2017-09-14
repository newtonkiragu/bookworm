Rails.application.routes.draw do
  resources :clubs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  resources :books do
    resources :comments
    get 'add_to_list/:id', :to => 'books#add_to_list', :as => :add_to_list
    get 'remove_from_list/:id', :to => 'books#remove_from_list', :as => :remove_from_list
    member do
     put "like", to: "books#upvote"
     put "dislike", to: "books#downvote"
   end
  end
  resources :users

  root 'landings#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
