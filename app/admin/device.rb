ActiveAdmin.register Device do

  config.filters = false

  permit_params :name,
                :image_url

  index do
    column :name
    column "Image" do |device|
      image_tag device.image_url, style: 'width: 5rem; height: 5rem'
    end
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Details' do
        f.inputs do
          f.input :name
          f.input :image_url
        end
        f.actions
      end
      tab 'Device Problems' do
        f.inputs do
          f.has_many :device_problems do |device_problem|
            device_problem.input :statement
            device_problem.input :content, as: :colonel_kurtz
            # device_problem.actions
          end
        end
      end
    end
  end

end
