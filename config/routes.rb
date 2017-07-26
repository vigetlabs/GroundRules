Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Workaround for path error caused by gem activeadmin_reorderable
  # match "/admin/devices/:device_id/device_problems/:id/reorder" => 'admin/device_problems#reorder', via: :post, as: :reorder_admin_device_problem


  root to: 'home#index'

end
