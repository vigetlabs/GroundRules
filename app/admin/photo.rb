ActiveAdmin.register Photo do
  config.sort_order = 'created_at_desc'

  filter :name_contains

  permit_params :image,
                :name

  index do
    column :image do |photo|
      image_tag photo.thumb('200x200#').url
    end
    column :name
    actions
  end

  show title: :name do
    attributes_table do
      row(:image) { |photo| image_tag photo.url }
      row :name
      row :created_at
      row :updated_at
    end

    panel 'Attachments' do
      table_for resource.photo_attachments do
        column 'Item', :attachable
        column('Role') { |a| a.attachable_name.titleize }
      end
    end
  end

  form do |f|
    inputs do
      if f.object.new_record?
        input :image, as: :file
      end
      input :name
    end
    actions
  end

end
