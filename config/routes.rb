Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'signout', sign_up: 'register' }
  root to: 'projects#new'
  resources :projects do
    resources :activities
  end
end
