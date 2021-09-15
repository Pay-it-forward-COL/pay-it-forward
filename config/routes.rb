Rails.application.routes.draw do
  root to: 'favors#index'
  devise_for :users
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  namespace :admin do
    resources :users
    resources :favors
    root 'favors#index'
  end


  namespace :api do
    namespace :v1 do
      resources :favors, only: %i[index show create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
