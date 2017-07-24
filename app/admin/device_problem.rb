ActiveAdmin.register DeviceProblem do

  config.filters = false

  belongs_to :device
  navigation_menu :device

  permit_params :statement,
                :content,
                :device_id

  index do
    column :statement
    column "Device" do |device_problem|
      device_problem.device.name
    end
    actions
  end

  form do |f|
    tabs do
      tab 'Statement' do
        f.input :statement, label: false
      end
      tab 'Content' do
        f.input :content, as: :colonel_kurtz, label: false
      end
    end
    f.actions
  end

end
