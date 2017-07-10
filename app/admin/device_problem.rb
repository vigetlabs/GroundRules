ActiveAdmin.register DeviceProblem do

  belongs_to :device
  navigation_menu :device

  permit_params :statement,
                :content,
                :device_id

  filter :device, as: :check_boxes

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
