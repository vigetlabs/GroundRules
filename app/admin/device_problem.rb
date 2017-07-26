ActiveAdmin.register DeviceProblem do
  config.sort_order = 'position_asc'
  config.paginate   = false
  config.filters    = false

  belongs_to :device
  navigation_menu :device

  reorderable

  permit_params :statement,
                :content,
                :device_id

  index as: :reorderable_table do
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
