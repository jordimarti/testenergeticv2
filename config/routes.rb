Rails.application.routes.draw do
  resources :identificacions
  resources :edificis do
  	resources :entitats
  end
  devise_for :users
  get 'edifici/:id/ambits', to: 'edificis#ambits', as: 'ambits'
  get 'home/contacta'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
