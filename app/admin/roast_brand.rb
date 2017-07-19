ActiveAdmin.register RoastBrand do

  belongs_to :roast
  navigation_menu :roast

  filter :brand_name_contains
  filter :roast_name_contains

  permit_params :brand_name,
                :roast_name,
                :image_id,
                :roast_id

  index do
    column :brand_name
    column :roast_name
    column "Image" do |roast_brand|
      image_tag roast_brand.image.url, style: 'width: 5rem; height: 5rem'
    end
    column "Roast" do |roast_brand|
      roast_brand.roast.name
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
