ActiveAdmin.register Roast do

  permit_params :name,
                :toggle_text,
                :description,
                :toggle_image_url,
                :thumbnail_image_url

  filter :name_contains

  index do
    column :name
    column "Toggle Image" do |roast|
      image_tag roast.toggle_image_url, style: 'width: 5rem; height: 5rem'
    end
    column "Thumbnail Image" do |roast|
      image_tag roast.thumbnail_image_url, style: 'width: 5rem; height: 5rem'
    end
    column :toggle_text
    column :description
    actions
  end

end
