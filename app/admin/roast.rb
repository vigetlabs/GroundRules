ActiveAdmin.register Roast do

  permit_params :name,
                :toggle_text,
                :description,
                :toggle_image_url,
                :thumbnail_image_url

  filter :name_contains

  action_item :device_problem, only: [:show, :edit] do
    link_to 'Brands', admin_roast_roast_brands_path(resource)
  end

  index do
    column :name
    column "Toggle Image" do |roast|
      image_tag roast.toggle_image_url, style: 'width: 5rem; height: 5rem'
    end
    column :toggle_text
    column :description
    actions
  end

end