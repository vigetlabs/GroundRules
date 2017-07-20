Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  get '/roasts', to: 'roasts#index'
  get '/devices', to: 'devices#index'
  match "/404" => "errors#error404", via: :all
  match "/500" => "errors#error500", via: :all

end
