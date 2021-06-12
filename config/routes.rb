Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :api do
    resources :users, only: [:create]
    post '/login', to: 'users#login'

    scope module: :v1 do
      resources :forwards, only: [:index] do
        member do
          post :direct
          get  :direct
        end
        collection do
          post :add
        end
      end
    end
  end
end
