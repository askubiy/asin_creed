Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'compositions#index'

  resources :compositions do
    member do
      get :generate
    end
  end
end
