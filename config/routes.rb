Rails.application.routes.draw do

  # Marketing Pages
  scope module: 'site' do
    root to: 'home#index'
  end

  # User Access Pages
  scope module: 'auth' do
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup', sign_up: '' }
  end

  # Wholesaler Adminstration Pages
  scope module: 'store', path: 'ws/:ws' do
    root to: 'dashboard#show', as: :dashboard
    resources :products
    resource :billing, only: [:show]
  end

end
