Rails.application.routes.draw do
  
  devise_for :users
  root 'plays#index'
  resources :plays do
    resources :reviews
  end
  #resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
