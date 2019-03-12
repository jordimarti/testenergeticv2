Rails.application.routes.draw do
  get 'murs/nou'
  resources :envolupants
  resources :component_murs
  resources :murs
  resources :identificacions
  resources :edificis do
  	resources :entitats
  end
  devise_for :users
  get 'edifici/:id/ambits', to: 'edificis#ambits', as: 'ambits'
  get 'edifici/:id/aixecament', to: 'edificis#aixecament', as: 'aixecament'
  get 'home/contacta'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
