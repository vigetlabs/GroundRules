ActiveAdmin.register DeviceProblem do

  menu parent: 'Device'

  belongs_to :device

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

end
