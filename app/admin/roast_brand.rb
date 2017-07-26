ActiveAdmin.register RoastBrand do
  config.sort_order = 'position_asc'
  config.paginate   = false

  belongs_to :roast
  navigation_menu :roast

  reorderable

  filter :brand_name_contains
  filter :roast_name_contains

  permit_params :brand_name,
                :roast_name,
                :image_id,
                :roast_id

  index as: :reorderable_table do
    column :brand_name
    column :roast_name
    column "Image" do |roast_brand|
      image_tag roast_brand.image.thumb('200x200#').url if roast_brand.image.present?
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :brand_name
      f.input :roast_name
      f.input :image, as: :photo_select
    end
    f.actions
  end

end
