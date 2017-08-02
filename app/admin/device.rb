ActiveAdmin.register Device do
  config.sort_order = 'position_asc'
  config.paginate   = false
  config.filters    = false

  reorderable

  permit_params :name,
                :image_id

  action_item :device_problem, only: [:show, :edit] do
    link_to 'Problems', admin_device_device_problems_path(resource)
  end

  index as: :reorderable_table do
    column :name
    column "Image" do |device|
      image_tag device.image.thumb('200x200#').url if device.image.present?
    end
    column :actions do |device|
      links = link_to I18n.t('active_admin.view'), resource_path(device)
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(device)
      if !device.device_problems.any?
        links += link_to "Delete", resource_path(device), :method => :delete
      end
      links
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :photo_select
    end
    f.actions
  end

end
