ActiveAdmin.register Roast do

  permit_params :name,
                :description,
                :sub_description,
                :image_id

  filter :name_contains

  action_item :roast_brand, only: [:show, :edit] do
    link_to 'Brands', admin_roast_roast_brands_path(resource)
  end

  index do
    column :name
    column "Image" do |roast|
      image_tag roast.image.thumb('200x200#').url if roast.image.present?
    end
    column :description
    column :sub_description
    actions
  end

end
