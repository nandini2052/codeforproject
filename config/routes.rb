Rails.application.routes.draw do
  root "pages#home"
  resources :houses
  get '/signup', to: 'sellers#new'
  resources :sellers, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
