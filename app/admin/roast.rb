ActiveAdmin.register Roast do
  config.sort_order = 'position_asc'
  config.paginate   = false

  reorderable

  permit_params :name,
                :description,
                :sub_description,
                :image_id

  filter :name_contains

  action_item :roast_brand, only: [:show, :edit] do
    link_to 'Brands', admin_roast_roast_brands_path(resource)
  end

  index as: :reorderable_table do
    column :name
    column "Image" do |roast|
      image_tag roast.image.thumb('200x200#').url if roast.image.present?
    end
    column :description
    column :sub_description
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :sub_description
      f.input :image, as: :photo_select
    end
    f.actions
  end

end
