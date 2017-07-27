class AddSlug < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :slug, :string
    Device.all.each do |device|
      device.update_column :slug, device.name.to_s.downcase.gsub(/[^a-z]/, '')
    end
  end
end
