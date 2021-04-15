Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show] do
    collection do
      get :create
    end
  end
end
