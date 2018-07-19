Rails.application.routes.draw do
  root "pages#home"
  resources :houses
  get 'signup', to:'users#new'
  #resources :sellers, except: [:new]
  resources :users, except: [:new]
  get 'login', to:'sessions#new'
  delete 'logout', to:'sessions#destroy'
  post 'login', to:'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
