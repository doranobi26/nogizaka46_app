Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :members
  root 'homes#top'
  get 'homes/about' =>'homes#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
