class AddActsAsList < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :position, :integer
    Device.order(:updated_at).each.with_index(1) do |item, index|
      item.update_column :position, index
    end

    add_column :device_problems, :position, :integer
    DeviceProblem.order(:updated_at).each.with_index(1) do |item, index|
      item.update_column :position, index
    end

    add_column :roasts, :position, :integer
    Roast.order(:updated_at).each.with_index(1) do |item, index|
      item.update_column :position, index
    end

    add_column :roast_brands, :position, :integer
    RoastBrand.order(:updated_at).each.with_index(1) do |item, index|
      item.update_column :position, index
    end
  end
end
