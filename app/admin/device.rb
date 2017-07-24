ActiveAdmin.register Device do

  config.filters = false

  permit_params :name,
                :image_id

  action_item :device_problem, only: [:show, :edit] do
    link_to 'Problems', admin_device_device_problems_path(resource)
  end

  index do
    column :name
    column "Image" do |device|
      image_tag device.image.thumb('200x200#').url if device.image.present?
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :photo_select
    end
    f.actions
  end

end
