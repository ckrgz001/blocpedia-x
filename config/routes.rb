Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :collaborators
  resources :wikis do 
    resources :collaborators, only: [:new, :create, :delete]
  end 

  get '/charges', to: 'charges#delete', as: :downgrade

  resources :charges, only: [:new, :create, :delete]


  get 'about' => 'welcome#about'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
