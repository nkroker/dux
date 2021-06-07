Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :api do
    resources :users, only: [:create]
    post '/login', to: 'user#login'
    get '/auto_login', to: 'user#auto_login'

    scope module: :v1 do
      resources :forward, only: [] do
        collection do
          post :add
        end
      end
    end
  end
end
