Rails.application.routes.draw do

  scope module: 'site' do
    root to: 'home#index'
  end

  scope module: 'account' do
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup', sign_up: '' }
  end
end
