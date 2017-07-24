ActiveAdmin.register Roast do

  permit_params :name,
                :toggle_text,
                :toggle_image_id

  filter :name_contains

  action_item :roast_brand, only: [:show, :edit] do
    link_to 'Brands', admin_roast_roast_brands_path(resource)
  end

  index do
    column :name
    column "Toggle Image" do |roast|
      image_tag roast.toggle_image.thumb('200x200#').url
    end
    column :toggle_text
    actions
  end

end
