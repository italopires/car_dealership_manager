Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy'
  end
  resources :dealerships
  resources :cars

  root to: 'dealerships#index'
end
